import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/asmr_catalog.dart';
import '../data/pillole.dart';
import '../data/scenes.dart';
import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';
import '../theme.dart';
import '../widgets/breathing_box.dart';
import '../widgets/calm_scene.dart';
import '../widgets/pill_card.dart';

class OggiScreen extends StatefulWidget {
  const OggiScreen({super.key});

  @override
  State<OggiScreen> createState() => _OggiScreenState();
}

class _OggiScreenState extends State<OggiScreen> {
  final _rnd = Random();
  late Pillola _pill = pillolaDelGiorno();

  String _saluto(AppLocalizations l) {
    final h = DateTime.now().hour;
    if (h < 6) return l.greetingNight;
    if (h < 13) return l.greetingMorning;
    if (h < 18) return l.greetingAfternoon;
    return l.greetingEvening;
  }

  String _data(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.MMMMEEEEd(locale).format(DateTime.now());
  }

  void _altraPillola() {
    final prefs = AppScope.of(context).prefs;
    final tutte = [...pillole, ...prefs.customPills];
    Pillola next;
    do {
      next = tutte[_rnd.nextInt(tutte.length)];
    } while (next.id == _pill.id && tutte.length > 1);
    setState(() => _pill = next);
  }

  AsmrVideo? _randomVideo(String categoriaId) {
    final v = videoDiCategoria(categoriaId);
    return v.isEmpty ? null : v[_rnd.nextInt(v.length)];
  }

  Future<void> _spegniLaMente() async {
    final scope = AppScope.of(context);
    final calmanti = asmrCategorie.where((c) => c.calmante).toList();
    final cat = calmanti[_rnd.nextInt(calmanti.length)];
    final video = _randomVideo(cat.id);
    final tutte = tutteLeScene(scope.images);
    final s = tutte[_rnd.nextInt(tutte.length)];
    await scope.prefs.setSceneId(s.id);
    if (video != null) {
      await scope.player.play(video, sleepMinutes: scope.prefs.sleepMinutes);
    }
    scope.nav.startBreathing();
  }

  Future<void> _mood(Mood m) async {
    final scope = AppScope.of(context);
    await scope.prefs.setSceneId(m.sceneId);
    await scope.prefs.setSideSeconds(m.lato);
    final video = _randomVideo(m.categoriaId);
    if (video != null) {
      await scope.player.play(video, sleepMinutes: scope.prefs.sleepMinutes);
    }
    scope.nav.startBreathing();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    final l = context.l10n;
    return ListenableBuilder(
      listenable: prefs,
      builder: (context, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            CalmScene(
              scene: scenaById(prefs.sceneId, AppScope.of(context).images),
              dim: 0.45,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
                    child: Row(
                      children: [
                        const BoxGlyph(),
                        const SizedBox(width: 10),
                        Text(
                          l.appName,
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            color: AppColors.text.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _saluto(l),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          _data(context),
                          style: const TextStyle(color: AppColors.muted),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(18, 22, 18, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: PillCard(
                              key: ValueKey(_pill.id),
                              pillola: _pill,
                              onAnother: _altraPillola,
                            ),
                          ),
                          const SizedBox(height: 26),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 10),
                            child: Text(
                              l.howDoYouFeel,
                              style: const TextStyle(
                                color: AppColors.muted,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final m in moods)
                                ActionChip(
                                  avatar: Text(m.emoji),
                                  label: Text(l.moodName(m.id)),
                                  backgroundColor: Colors.black.withValues(
                                    alpha: 0.3,
                                  ),
                                  side: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.1),
                                  ),
                                  onPressed: () => _mood(m),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FilledButton.icon(
                          onPressed: _spegniLaMente,
                          icon: const Icon(Icons.self_improvement),
                          label: Text(l.quickStart),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l.quickStartHint,
                          textAlign: TextAlign.center,
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
          ],
        );
      },
    );
  }
}
