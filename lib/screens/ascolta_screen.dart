import 'package:flutter/material.dart';

import '../data/asmr_catalog.dart';
import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';
import '../services/prefs.dart';
import '../theme.dart';
import '../widgets/mixer_sheet.dart';
import '../widgets/video_tile.dart';

/// Libreria ASMR: griglia di categorie → elenco video. La navigazione è
/// interna alla scheda (nessuna route) così il mini-player resta visibile.
class AscoltaScreen extends StatefulWidget {
  const AscoltaScreen({super.key});

  @override
  State<AscoltaScreen> createState() => _AscoltaScreenState();
}

class _AscoltaScreenState extends State<AscoltaScreen> {
  AsmrCategory? _selected;

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    return PopScope(
      canPop: _selected == null,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) setState(() => _selected = null);
      },
      child: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _selected == null
              ? _CategoryGrid(
                  key: const ValueKey('grid'),
                  onSelect: (c) => setState(() => _selected = c),
                )
              : ListenableBuilder(
                  key: ValueKey(_selected!.id),
                  listenable: prefs,
                  builder: (context, _) => _CategoryList(
                    category: _selected!,
                    videos: _selected!.id == categoriaMiei.id
                        ? prefs.customVideos
                        : videoDiCategoria(_selected!.id),
                    onBack: () => setState(() => _selected = null),
                  ),
                ),
        ),
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({super.key, required this.onSelect});
  final ValueChanged<AsmrCategory> onSelect;

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    final l = context.l10n;
    return ListenableBuilder(
      listenable: prefs,
      builder: (context, _) {
        final categorie = [
          ...asmrCategorie,
          if (prefs.customVideos.isNotEmpty) categoriaMiei,
        ];
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 4),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.tabListen,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l.listenSubtitle,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              sliver: SliverToBoxAdapter(child: _MixerCard(l: l)),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.25,
                ),
                delegate: SliverChildBuilderDelegate((context, i) {
                  final c = categorie[i];
                  final n = c.id == categoriaMiei.id
                      ? prefs.customVideos.length
                      : videoDiCategoria(c.id).length;
                  return _CategoryCard(
                    category: c,
                    count: n,
                    onTap: () => onSelect(c),
                  );
                }, childCount: categorie.length),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Card larga in cima alla griglia: apre il mixer di suoni locali.
class _MixerCard extends StatelessWidget {
  const _MixerCard({required this.l});
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final mixer = AppScope.of(context).mixer;
    return ListenableBuilder(
      listenable: mixer,
      builder: (context, _) {
        return Material(
          borderRadius: BorderRadius.circular(22),
          clipBehavior: Clip.antiAlias,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.accent.withValues(alpha: 0.35),
                  AppColors.accent2.withValues(alpha: 0.3),
                ],
              ),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.3),
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: InkWell(
              onTap: () => showMixerSheet(context),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
                child: Row(
                  children: [
                    const Icon(Icons.tune, color: Colors.white, size: 28),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.mixerTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            mixer.isActive
                                ? mixer.active
                                      .map((s) => l.mixerSoundName(s.id))
                                      .join(' · ')
                                : l.mixerCardDesc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      mixer.isActive ? Icons.graphic_eq : Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.count,
    required this.onTap,
  });

  final AsmrCategory category;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Material(
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: category.colori,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  category.icona,
                  color: Colors.white.withValues(alpha: 0.9),
                  size: 28,
                ),
                const Spacer(),
                Text(
                  l.categoryName(category.id),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l.videoCount(count),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    required this.category,
    required this.videos,
    required this.onBack,
  });

  final AsmrCategory category;
  final List<AsmrVideo> videos;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    final l = context.l10n;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 16, 4),
          child: Row(
            children: [
              IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back)),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: category.colori),
                ),
                child: Icon(category.icona, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.categoryName(category.id),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      l.categoryDesc(category.id),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: videos.isEmpty
              ? Center(
                  child: Text(
                    l.noVideosHere,
                    style: const TextStyle(color: AppColors.muted),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 24),
                  itemCount: videos.length,
                  itemBuilder: (_, i) => VideoTile(
                    video: videos[i],
                    onRemove: videos[i].custom
                        ? () => _confirmRemove(context, prefs, videos[i])
                        : null,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> _confirmRemove(
    BuildContext context,
    AppPrefs prefs,
    AsmrVideo v,
  ) async {
    final l = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l.removeVideoTitle),
        content: Text(v.titolo.get(context)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l.remove),
          ),
        ],
      ),
    );
    if (ok == true) await prefs.removeCustomVideo(v.id);
  }
}
