import 'package:flutter/material.dart';

import '../data/asmr_catalog.dart';
import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';
import '../theme.dart';
import 'video_tile.dart';

/// Bottom sheet per scegliere un suono senza lasciare la schermata Respira.
Future<void> showAsmrPicker(BuildContext context, {String? categoriaId}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => _AsmrPickerSheet(initial: categoriaId),
  );
}

class _AsmrPickerSheet extends StatefulWidget {
  const _AsmrPickerSheet({this.initial});
  final String? initial;

  @override
  State<_AsmrPickerSheet> createState() => _AsmrPickerSheetState();
}

class _AsmrPickerSheetState extends State<_AsmrPickerSheet> {
  late String _cat = widget.initial ?? asmrCategorie.first.id;

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    final categorie = [
      ...asmrCategorie,
      if (prefs.customVideos.isNotEmpty) categoriaMiei,
    ];
    final List<AsmrVideo> videos = _cat == categoriaMiei.id
        ? prefs.customVideos
        : videoDiCategoria(_cat);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      builder: (context, scroll) {
        return Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.muted.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
              child: Row(
                children: [
                  Text(
                    context.l10n.chooseSound,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categorie.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final c = categorie[i];
                  return ChoiceChip(
                    label: Text(context.l10n.categoryName(c.id)),
                    avatar: Icon(c.icona, size: 16),
                    selected: c.id == _cat,
                    onSelected: (_) => setState(() => _cat = c.id),
                  );
                },
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                controller: scroll,
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 24),
                itemCount: videos.length,
                itemBuilder: (_, i) => VideoTile(
                  video: videos[i],
                  onPlayed: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
