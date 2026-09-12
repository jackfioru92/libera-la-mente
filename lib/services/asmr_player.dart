import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../models/models.dart';

/// Un solo player YouTube per tutta l'app. Il widget [YoutubePlayer] che lo
/// mostra vive nel mini-player della shell, così l'audio continua quando si
/// cambia scheda.
class AsmrPlayer extends ChangeNotifier {
  YoutubePlayerController? _controller;
  StreamSubscription<YoutubePlayerValue>? _sub;

  YoutubePlayerController? get controller => _controller;

  AsmrVideo? current;
  PlayerState state = PlayerState.unknown;
  bool expanded = false;
  int volume = 80;

  Timer? _sleepTimer;
  DateTime? sleepEndsAt;

  bool get hasVideo => _controller != null && current != null;
  bool get isPlaying =>
      state == PlayerState.playing || state == PlayerState.buffering;
  bool get sleepActive => sleepEndsAt != null;

  Duration? get sleepRemaining {
    final end = sleepEndsAt;
    if (end == null) return null;
    final d = end.difference(DateTime.now());
    return d.isNegative ? Duration.zero : d;
  }

  Future<void> play(AsmrVideo v, {int sleepMinutes = 0}) async {
    if (_controller == null) {
      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: false,
          showFullscreenButton: false,
          enableCaption: false,
          strictRelatedVideos: true,
          playsInline: true,
          showVideoAnnotations: false,
        ),
      );
      _sub = _controller!.stream.listen(_onValue);
    }
    current = v;
    state = PlayerState.buffering;
    notifyListeners();
    try {
      await _controller!.loadVideoById(videoId: v.id);
      await _controller!.setVolume(volume);
    } catch (e) {
      debugPrint('AsmrPlayer.play: $e');
    }
    if (sleepMinutes > 0) startSleepTimer(sleepMinutes);
  }

  void _onValue(YoutubePlayerValue value) {
    final prev = state;
    state = value.playerState;
    if (state == PlayerState.ended && current != null) {
      // I video brevi ripartono da capo: l'ascolto non deve interrompersi.
      _controller?.seekTo(seconds: 0, allowSeekAhead: true);
      _controller?.playVideo();
    }
    if (prev != state) notifyListeners();
  }

  Future<void> togglePlay() async {
    final c = _controller;
    if (c == null) return;
    if (isPlaying) {
      await c.pauseVideo();
    } else {
      await c.playVideo();
    }
  }

  Future<void> pause() => _controller?.pauseVideo() ?? Future.value();

  Future<void> setVolume(int v) async {
    volume = v.clamp(0, 100);
    notifyListeners();
    await _controller?.setVolume(volume);
  }

  void toggleExpanded() {
    expanded = !expanded;
    notifyListeners();
  }

  void startSleepTimer(int minutes) {
    _sleepTimer?.cancel();
    if (minutes <= 0) {
      sleepEndsAt = null;
      notifyListeners();
      return;
    }
    sleepEndsAt = DateTime.now().add(Duration(minutes: minutes));
    _sleepTimer = Timer(Duration(minutes: minutes), () async {
      sleepEndsAt = null;
      await _controller?.pauseVideo();
      notifyListeners();
    });
    notifyListeners();
  }

  void cancelSleepTimer() => startSleepTimer(0);

  /// Chiude del tutto il player (il WebView viene smontato).
  Future<void> close() async {
    final c = _release();
    notifyListeners();
    await _shutdown(c);
  }

  /// Azzera lo stato in modo sincrono e restituisce il controller da chiudere.
  YoutubePlayerController? _release() {
    _sleepTimer?.cancel();
    _sleepTimer = null;
    sleepEndsAt = null;
    _sub?.cancel();
    _sub = null;
    final c = _controller;
    _controller = null;
    current = null;
    state = PlayerState.unknown;
    expanded = false;
    return c;
  }

  static Future<void> _shutdown(YoutubePlayerController? c) async {
    if (c == null) return;
    try {
      await c.stopVideo();
      await c.close();
    } catch (_) {}
  }

  @override
  void dispose() {
    // Niente notifyListeners qui: il notifier sta per essere distrutto.
    _shutdown(_release());
    super.dispose();
  }
}
