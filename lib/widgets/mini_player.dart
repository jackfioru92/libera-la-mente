import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../l10n/l10n_ext.dart';
import '../services/app_scope.dart';
import '../services/sound_mixer.dart';
import '../theme.dart';
import 'mixer_sheet.dart';

/// Barra del player sopra la navigazione. Contiene l'unico [YoutubePlayer]
/// dell'app: resta montato mentre si cambia scheda, così l'audio continua.
class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = AppScope.of(context);
    final player = scope.player;
    final mixer = scope.mixer;
    return ListenableBuilder(
      listenable: Listenable.merge([player, mixer]),
      builder: (context, _) {
        final controller = player.controller;
        final video = player.current;
        final hasVideo = controller != null && video != null;
        if (!hasVideo && !mixer.isActive) {
          return const SizedBox.shrink();
        }
        if (!hasVideo) {
          return Material(
            color: AppColors.surface,
            elevation: 8,
            child: _MixerRow(mixer: mixer),
          );
        }

        final width = MediaQuery.sizeOf(context).width;
        final expanded = player.expanded;
        final playerWidth = expanded ? width : 112.0;

        return Material(
          color: AppColors.surface,
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (mixer.isActive) _MixerRow(mixer: mixer),
              Container(height: 1, color: Colors.white.withValues(alpha: 0.06)),
              Row(
                children: [
                  // Il player deve restare nella stessa posizione dell'albero
                  // sia in modalità mini che estesa, altrimenti il WebView
                  // viene ricreato e la riproduzione riparte.
                  SizedBox(
                    width: playerWidth,
                    child: YoutubePlayer(
                      controller: controller,
                      aspectRatio: 16 / 9,
                      backgroundColor: Colors.black,
                      autoFullScreen: false,
                      enableFullScreenOnVerticalDrag: false,
                    ),
                  ),
                  if (!expanded) ...[
                    const SizedBox(width: 10),
                    Expanded(child: _Info(compact: true)),
                    _PlayPause(),
                    _CloseButton(),
                    const SizedBox(width: 4),
                  ],
                ],
              ),
              if (expanded) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 4, 0),
                  child: Row(
                    children: [
                      Expanded(child: _Info(compact: false)),
                      _PlayPause(),
                      _CloseButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.volume_down,
                        color: AppColors.muted,
                        size: 20,
                      ),
                      Expanded(
                        child: Slider(
                          value: player.volume.toDouble(),
                          min: 0,
                          max: 100,
                          onChanged: (v) => player.setVolume(v.round()),
                        ),
                      ),
                      const Icon(
                        Icons.volume_up,
                        color: AppColors.muted,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      _SleepTimerButton(),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

/// Riga compatta del mixer: suoni attivi, stop, apri il foglio.
class _MixerRow extends StatelessWidget {
  const _MixerRow({required this.mixer});
  final SoundMixer mixer;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return InkWell(
      onTap: () => showMixerSheet(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 6, 4, 6),
        child: Row(
          children: [
            const Icon(Icons.tune, size: 18, color: AppColors.accent),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${l.mixerActive} · ${mixer.active.map((s) => l.mixerSoundName(s.id)).join(', ')}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12.5),
              ),
            ),
            IconButton(
              tooltip: l.mixerStop,
              onPressed: mixer.stop,
              icon: const Icon(
                Icons.stop_circle_outlined,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({required this.compact});
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final player = AppScope.of(context).player;
    final video = player.current!;
    final l = context.l10n;
    final sleep = player.sleepRemaining;
    final sub = sleep != null ? l.sleepsIn(_fmt(l, sleep)) : video.autore;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: player.toggleExpanded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            video.titolo.get(context),
            maxLines: compact ? 1 : 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              if (sleep != null)
                const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.bedtime,
                    size: 12,
                    color: AppColors.accent2,
                  ),
                ),
              Expanded(
                child: Text(
                  sub,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: sleep != null ? AppColors.accent2 : AppColors.muted,
                  ),
                ),
              ),
              if (compact)
                Icon(
                  Icons.expand_less,
                  size: 16,
                  color: AppColors.muted.withValues(alpha: 0.7),
                ),
            ],
          ),
        ],
      ),
    );
  }

  static String _fmt(AppLocalizations l, Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return m > 0 ? l.minutesShort(m) : l.secondsShort(s);
  }
}

class _PlayPause extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = AppScope.of(context).player;
    final buffering =
        player.state == PlayerState.buffering ||
        player.state == PlayerState.unknown ||
        player.state == PlayerState.unStarted;
    return IconButton(
      iconSize: 30,
      onPressed: player.togglePlay,
      icon: buffering && !player.isPlaying
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(player.isPlaying ? Icons.pause_circle : Icons.play_circle),
      color: AppColors.accent,
    );
  }
}

class _CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = AppScope.of(context).player;
    return IconButton(
      tooltip: context.l10n.close,
      onPressed: player.close,
      icon: const Icon(Icons.close, color: AppColors.muted),
    );
  }
}

class _SleepTimerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = AppScope.of(context).player;
    final active = player.sleepActive;
    final l = context.l10n;
    return PopupMenuButton<int>(
      tooltip: l.sleepTimerTooltip,
      color: AppColors.surface2,
      onSelected: (m) => player.startSleepTimer(m),
      itemBuilder: (_) => [
        PopupMenuItem(value: 0, child: Text(l.sleepOff)),
        PopupMenuItem(value: 15, child: Text(l.nMinutes(15))),
        PopupMenuItem(value: 30, child: Text(l.nMinutes(30))),
        PopupMenuItem(value: 45, child: Text(l.nMinutes(45))),
        PopupMenuItem(value: 60, child: Text(l.oneHour)),
        PopupMenuItem(value: 90, child: Text(l.oneHourHalf)),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          active ? Icons.bedtime : Icons.bedtime_outlined,
          color: active ? AppColors.accent2 : AppColors.muted,
        ),
      ),
    );
  }
}
