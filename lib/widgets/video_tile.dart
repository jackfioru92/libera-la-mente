import 'package:flutter/material.dart';

import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';
import '../theme.dart';

/// Riga con miniatura YouTube, titolo, autore, cuore e play.
class VideoTile extends StatelessWidget {
  const VideoTile({
    super.key,
    required this.video,
    this.onPlayed,
    this.onRemove,
  });

  final AsmrVideo video;
  final VoidCallback? onPlayed;

  /// Se presente, mostra un menu "Rimuovi" (solo per i video aggiunti dall'utente).
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final scope = AppScope.of(context);
    final prefs = scope.prefs;
    final player = scope.player;

    return ListenableBuilder(
      listenable: Listenable.merge([prefs, player]),
      builder: (context, _) {
        final isCurrent = player.current?.id == video.id;
        final playing = isCurrent && player.isPlaying;
        final fav = prefs.isFavVideo(video.id);

        return Material(
          color: isCurrent
              ? AppColors.accent.withValues(alpha: 0.10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              if (isCurrent) {
                await player.togglePlay();
              } else {
                await player.play(video, sleepMinutes: prefs.sleepMinutes);
              }
              onPlayed?.call();
            },
            onLongPress: onRemove,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 104,
                      height: 60,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            video.thumbnail,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: AppColors.surface2,
                              child: const Icon(
                                Icons.music_note,
                                color: AppColors.muted,
                              ),
                            ),
                          ),
                          if (isCurrent)
                            Container(
                              color: Colors.black45,
                              child: Icon(
                                playing ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.titolo.get(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          video.autore,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: fav ? context.l10n.favRemove : context.l10n.favAdd,
                    onPressed: () => prefs.toggleFavVideo(video.id),
                    icon: Icon(
                      fav ? Icons.favorite : Icons.favorite_border,
                      color: fav ? AppColors.accent : AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
