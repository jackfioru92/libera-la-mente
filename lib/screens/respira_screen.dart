import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../data/scenes.dart';
import '../l10n/l10n_ext.dart';
import '../services/app_scope.dart';
import '../services/haptics.dart';
import '../services/prefs.dart';
import '../services/voice_guide.dart';
import '../theme.dart';
import '../widgets/asmr_picker.dart';
import '../widgets/breathing_box.dart';
import '../widgets/calm_scene.dart';
import '../widgets/support_sheet.dart';

class RespiraScreen extends StatefulWidget {
  const RespiraScreen({super.key});

  @override
  State<RespiraScreen> createState() => _RespiraScreenState();
}

class _RespiraScreenState extends State<RespiraScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 16),
  )..addListener(_tick);

  AppScope? _scope;
  bool _running = false;
  int _phase = 0;
  int _cycles = 0;
  DateTime? _startedAt;
  Timer? _endTimer;
  int _lastTicket = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scope = AppScope.of(context);
    if (_scope != scope) {
      _scope?.nav.removeListener(_onNav);
      _scope = scope;
      _lastTicket = scope.nav.autoStartTicket;
      scope.nav.addListener(_onNav);
    }
  }

  @override
  void dispose() {
    _scope?.nav.removeListener(_onNav);
    _endTimer?.cancel();
    _ctrl.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  void _onNav() {
    final nav = _scope!.nav;
    if (nav.autoStartTicket != _lastTicket) {
      _lastTicket = nav.autoStartTicket;
      if (!_running) _start();
    }
  }

  int _lastSecond = -1;

  /// Vibrazioni per respirare a occhi chiusi: un colpo deciso a Inspira ed
  /// Espira, un doppio tocco ai Trattieni, e un tic leggero a ogni secondo
  /// durante inspirazione ed espirazione (il "conteggio" nel palmo).
  Future<void> _hapticPhase(int phase) =>
      phase == 1 || phase == 3 ? Haptics.double_() : Haptics.strong();

  void _tick() {
    final s = breathState(_ctrl.value);
    final prefs = _scope!.prefs;
    if (prefs.haptics && (s.phase == 0 || s.phase == 2)) {
      final second = (s.progress * prefs.sideSeconds).floor();
      if (second != _lastSecond) {
        _lastSecond = second;
        if (second > 0) Haptics.tick();
      }
    }
    if (s.phase != _phase) {
      _lastSecond = -1;
      if (prefs.haptics) _hapticPhase(s.phase);
      if (prefs.voiceGuide) {
        _scope!.voice.say(_phaseKeys[s.phase], context.l10n.phases[s.phase]);
      }
      setState(() {
        if (s.phase == 0) _cycles++;
        _phase = s.phase;
      });
    }
  }

  static const _phaseKeys = [
    VoiceGuide.inhale,
    VoiceGuide.hold,
    VoiceGuide.exhale,
    VoiceGuide.hold,
  ];

  /// Lingua dell'app + voce scelta dall'utente (o la migliore disponibile).
  Future<void> _prepareVoice() {
    final lang = context.lang;
    final id = _scope!.prefs.voiceId(lang);
    return _scope!.voice.setLanguage(
      lang,
      preferredVoiceId: id.isEmpty ? null : id,
    );
  }

  void _start() {
    final prefs = _scope!.prefs;
    _cycles = 0;
    _phase = 0;
    _startedAt = DateTime.now();
    _ctrl.duration = Duration(seconds: prefs.sideSeconds * 4);
    _ctrl.repeat();
    WakelockPlus.enable();
    _endTimer?.cancel();
    if (prefs.sessionMinutes > 0) {
      _endTimer = Timer(
        Duration(minutes: prefs.sessionMinutes),
        () => _stop(completed: true),
      );
    }
    if (prefs.haptics) Haptics.confirm();
    if (prefs.voiceGuide) {
      final l = context.l10n;
      _prepareVoice().then(
        (_) => _scope!.voice.say(_phaseKeys[0], l.phases[0]),
      );
    }
    setState(() => _running = true);
  }

  Future<void> _stop({bool completed = false}) async {
    _endTimer?.cancel();
    _ctrl.stop();
    _ctrl.value = 0;
    WakelockPlus.disable();
    _scope!.voice.stop();
    final elapsed = DateTime.now().difference(_startedAt ?? DateTime.now());
    final cycles = _cycles;
    setState(() {
      _running = false;
      _phase = 0;
    });
    if (completed || elapsed.inSeconds >= 60) {
      await _scope!.prefs.recordSession(math.max(1, elapsed.inMinutes));
    }
    if (completed && mounted) {
      if (_scope!.prefs.haptics) Haptics.strong();
      final l = context.l10n;
      if (_scope!.prefs.voiceGuide) {
        _scope!.voice.say(VoiceGuide.complete, l.sessionCompletedTitle);
      }
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(l.sessionCompletedTitle),
          content: Text(
            l.sessionCompletedBody(cycles, math.max(1, elapsed.inMinutes)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l.thanks),
            ),
          ],
        ),
      );
      // Dopo la prima sessione completa, e solo una volta: l'app è stata
      // provata davvero, ora ha senso raccontare che è un progetto indipendente.
      if (mounted && !_scope!.prefs.supportAsked) {
        await _scope!.prefs.setSupportAsked();
        if (mounted) await showSupportSheet(context);
      }
    }
  }

  void _setSide(int s) {
    _scope!.prefs.setSideSeconds(s);
    if (_running) {
      _ctrl.duration = Duration(seconds: s * 4);
      _ctrl.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scope = AppScope.of(context);
    final prefs = scope.prefs;
    final player = scope.player;
    final l = context.l10n;

    return ListenableBuilder(
      listenable: prefs,
      builder: (context, _) {
        final scena = scenaById(prefs.sceneId, scope.images);
        final sceltaScene = tutteLeScene(scope.images);
        final side = prefs.sideSeconds;

        return Stack(
          fit: StackFit.expand,
          children: [
            AnimatedBuilder(
              animation: _ctrl,
              builder: (_, _) => CalmScene(
                scene: scena,
                breath: _running ? breathState(_ctrl.value).breath : 0.15,
                dim: 0.4,
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, outer) {
                  // Con mini-player espanso (video 16:9 + mixer) lo spazio
                  // non basta: la pagina scorre e il quadrato non si schiaccia.
                  final compact = outer.maxHeight < 620;
                  final column = Column(
                    mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
                    children: [
                      // ------------------------------------------------ header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 14, 10, 2),
                        child: Row(
                          children: [
                            Text(
                              l.tabBreathe,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              iconSize: 32,
                              padding: const EdgeInsets.all(10),
                              tooltip: prefs.haptics
                                  ? l.hapticsOn
                                  : l.hapticsOff,
                              onPressed: () {
                                final on = !prefs.haptics;
                                prefs.setHaptics(on);
                                if (on) Haptics.confirm();
                              },
                              icon: Icon(
                                Icons.vibration,
                                color: prefs.haptics
                                    ? AppColors.accent
                                    : AppColors.muted.withValues(alpha: 0.6),
                              ),
                            ),
                            IconButton(
                              iconSize: 36,
                              padding: const EdgeInsets.all(10),
                              tooltip: prefs.voiceGuide
                                  ? l.voiceOn
                                  : l.voiceOff,
                              onPressed: () {
                                prefs.setVoiceGuide(!prefs.voiceGuide);
                                if (prefs.voiceGuide) {
                                  _prepareVoice().then(
                                    (_) => _scope!.voice.say(
                                      VoiceGuide.test,
                                      l.voiceOn,
                                    ),
                                  );
                                } else {
                                  _scope!.voice.stop();
                                }
                              },
                              icon: Icon(
                                prefs.voiceGuide
                                    ? Icons.record_voice_over
                                    : Icons.voice_over_off,
                                color: prefs.voiceGuide
                                    ? AppColors.accent
                                    : AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Sfondi: riga a sé, scorrevole (colori a sinistra, foto a destra).
                      SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          children: [
                            for (final s in sceltaScene)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SceneDot(
                                  scene: s,
                                  size: 34,
                                  selected: s.id == scena.id,
                                  onTap: () => prefs.setSceneId(s.id),
                                ),
                              ),
                          ],
                        ),
                      ),
                      // --------------------------------------------- quadrato
                      _boxSection(compact, l, prefs, side),
                      // --------------------------------------------- controlli
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
                        child: Column(
                          children: [
                            _ChipRow(
                              label: l.labelSide,
                              values: const [3, 4, 5, 6],
                              selected: side,
                              format: l.secondsShort,
                              onSelected: _setSide,
                            ),
                            const SizedBox(height: 6),
                            _ChipRow(
                              label: l.labelMinutes,
                              values: const [1, 3, 5, 10, 0],
                              selected: prefs.sessionMinutes,
                              format: (v) => v == 0 ? '∞' : '$v',
                              onSelected: (v) {
                                prefs.setSessionMinutes(v);
                                if (_running) {
                                  _endTimer?.cancel();
                                  if (v > 0) {
                                    final elapsed = DateTime.now().difference(
                                      _startedAt ?? DateTime.now(),
                                    );
                                    final left = Duration(minutes: v) - elapsed;
                                    _endTimer = Timer(
                                      left.isNegative ? Duration.zero : left,
                                      () => _stop(completed: true),
                                    );
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: ListenableBuilder(
                                    listenable: player,
                                    builder: (context, _) {
                                      final v = player.current;
                                      return OutlinedButton.icon(
                                        onPressed: () =>
                                            showAsmrPicker(context),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: AppColors.text,
                                          side: BorderSide(
                                            color: Colors.white.withValues(
                                              alpha: 0.2,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              999,
                                            ),
                                          ),
                                        ),
                                        icon: Icon(
                                          v == null
                                              ? Icons.headphones
                                              : Icons.graphic_eq,
                                          size: 18,
                                        ),
                                        label: Text(
                                          v == null
                                              ? l.soundButton
                                              : v.titolo.get(context),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: FilledButton.icon(
                                    onPressed: _running
                                        ? () => _stop()
                                        : _start,
                                    style: _running
                                        ? FilledButton.styleFrom(
                                            backgroundColor: AppColors.surface2,
                                            foregroundColor: AppColors.text,
                                          )
                                        : null,
                                    icon: Icon(
                                      _running ? Icons.stop : Icons.play_arrow,
                                    ),
                                    label: Text(_running ? l.stop : l.start),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                  return compact
                      ? SingleChildScrollView(child: column)
                      : column;
                },
              ),
            ),
          ],
        );
      },
    );
  }

  /// Il quadrato con la riga di stato. Se c'è spazio, occupa tutto il centro
  /// adattando la dimensione; altrimenti dimensione fissa e pagina scorrevole.
  Widget _boxSection(
    bool compact,
    AppLocalizations l,
    AppPrefs prefs,
    int side,
  ) {
    if (compact) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: _box(
            math.min(MediaQuery.sizeOf(context).width - 80, 240.0),
            l,
            prefs,
            side,
          ),
        ),
      );
    }
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: _box(
            math
                .min(
                  math.min(
                    MediaQuery.sizeOf(context).width - 80,
                    constraints.maxHeight - 56,
                  ),
                  300.0,
                )
                .clamp(140.0, 300.0),
            l,
            prefs,
            side,
          ),
        ),
      ),
    );
  }

  Widget _box(double size, AppLocalizations l, AppPrefs prefs, int side) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, _) {
        final s = breathState(_ctrl.value);
        final secondsLeft = (side - s.progress * side).ceil().clamp(1, side);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BreathingBox(
              phase: s.phase,
              phaseProgress: s.progress,
              breath: _running ? s.breath : 0.2,
              secondsLeft: secondsLeft,
              running: _running,
              label: _running ? l.phases[s.phase] : l.ready,
              size: size,
            ),
            const SizedBox(height: 8),
            Text(
              _statusLine(l, prefs.sessionMinutes),
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
          ],
        );
      },
    );
  }

  String _statusLine(AppLocalizations l, int sessionMinutes) {
    if (!_running) {
      return sessionMinutes == 0 ? l.noTimeLimit : l.sessionOf(sessionMinutes);
    }
    final elapsed = DateTime.now().difference(_startedAt ?? DateTime.now());
    if (sessionMinutes == 0) {
      return l.cycleElapsed(_cycles + 1, _fmt(elapsed));
    }
    final left = Duration(minutes: sessionMinutes) - elapsed;
    return l.cycleRemaining(
      _cycles + 1,
      _fmt(left.isNegative ? Duration.zero : left),
    );
  }

  static String _fmt(Duration d) {
    final m = d.inMinutes;
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

class _ChipRow extends StatelessWidget {
  const _ChipRow({
    required this.label,
    required this.values,
    required this.selected,
    required this.format,
    required this.onSelected,
  });

  final String label;
  final List<int> values;
  final int selected;
  final String Function(int) format;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 58,
          child: Text(
            label,
            style: const TextStyle(color: AppColors.muted, fontSize: 13),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 6,
            children: [
              for (final v in values)
                ChoiceChip(
                  label: Text(format(v)),
                  selected: v == selected,
                  visualDensity: VisualDensity.compact,
                  backgroundColor: Colors.black.withValues(alpha: 0.3),
                  onSelected: (_) => onSelected(v),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
