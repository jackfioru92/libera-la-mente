import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';
import '../theme.dart';

/// Card "vetro" con il testo di una pillola, attribuzione e azioni.
class PillCard extends StatelessWidget {
  const PillCard({
    super.key,
    required this.pillola,
    this.onAnother,
    this.compact = false,
  });

  final Pillola pillola;
  final VoidCallback? onAnother;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    final l = context.l10n;
    final testo = pillola.testo.get(context);
    final attr = l.pillAttribution(pillola, context.lang);

    return ListenableBuilder(
      listenable: prefs,
      builder: (context, _) {
        final fav = prefs.isFavPill(pillola.id);
        return Container(
          padding: EdgeInsets.all(compact ? 18 : 26),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.28),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                testo,
                style: TextStyle(
                  fontSize: compact ? 17 : 22,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text,
                ),
              ),
              if (attr.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  '— $attr',
                  style: TextStyle(
                    fontSize: compact ? 12 : 13,
                    color: AppColors.accent.withValues(alpha: 0.9),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    tooltip: fav ? l.pillUnsave : l.pillSave,
                    onPressed: () => prefs.toggleFavPill(pillola.id),
                    icon: Icon(
                      fav ? Icons.favorite : Icons.favorite_border,
                      color: fav ? AppColors.accent : AppColors.muted,
                    ),
                  ),
                  IconButton(
                    tooltip: l.pillCopy,
                    onPressed: () async {
                      final txt = attr.isEmpty ? testo : '$testo\n— $attr';
                      await Clipboard.setData(ClipboardData(text: txt));
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(l.pillCopied)));
                      }
                    },
                    icon: const Icon(
                      Icons.copy_rounded,
                      color: AppColors.muted,
                    ),
                  ),
                  const Spacer(),
                  if (onAnother != null)
                    TextButton.icon(
                      onPressed: onAnother,
                      icon: const Icon(Icons.refresh, size: 18),
                      label: Text(l.pillAnother),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.text.withValues(alpha: 0.85),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
