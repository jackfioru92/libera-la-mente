import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/asmr_catalog.dart';
import '../data/pillole.dart';
import '../data/scenes.dart';
import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';
import '../services/prefs.dart';
import '../services/voice_guide.dart';
import '../services/youtube_oembed.dart';
import '../theme.dart';
import '../widgets/calm_scene.dart';
import '../widgets/pill_card.dart';
import '../widgets/video_tile.dart';

/// Email dell'autore: usata per le donazioni PayPal e per il contatto.
const String kContactEmail = 'fgiacomo92@gmail.com';

/// Link "offrimi un caffè".
///
/// Il flusso PayPal "Donate" (`/donate/?business=...`) è riservato alle
/// organizzazioni: con un conto personale mostra "l'organizzazione non può
/// accettare donazioni". Qui si usa il pagamento classico a importo libero,
/// che i conti personali accettano. Se crei un link PayPal.Me (paypal.me),
/// sostituisci l'intera stringa con `https://paypal.me/<tuonome>`.
final String kDonateUrl = Uri.https('www.paypal.com', '/cgi-bin/webscr', {
  'cmd': '_xclick',
  'business': kContactEmail,
  'currency_code': 'EUR',
  'item_name': 'Un caffè per Libera la Mente',
  'no_shipping': '1',
}).toString();

/// Lingue selezionabili in Oasi: codice → nome nella lingua stessa.
const Map<String, String> kLanguageNames = {'it': 'Italiano', 'en': 'English'};

class OasiScreen extends StatelessWidget {
  const OasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = AppScope.of(context).prefs;
    final l = context.l10n;
    return SafeArea(
      child: ListenableBuilder(
        listenable: prefs,
        builder: (context, _) {
          final tutteLePillole = [...pillole, ...prefs.customPills];
          final pilloleSalvate = tutteLePillole
              .where((p) => prefs.isFavPill(p.id))
              .toList();
          final tuttiIVideo = [...asmrVideos, ...prefs.customVideos];
          final videoSalvati = tuttiIVideo
              .where((v) => prefs.isFavVideo(v.id))
              .toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 32),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  l.oasisTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _StatsCard(prefs: prefs),
              const SizedBox(height: 12),
              const _DonateCard(),

              _Section(
                title: l.savedPills,
                trailing: '${pilloleSalvate.length}',
                child: pilloleSalvate.isEmpty
                    ? _Hint(l.savedPillsHint)
                    : Column(
                        children: [
                          for (final p in pilloleSalvate) ...[
                            PillCard(pillola: p, compact: true),
                            const SizedBox(height: 10),
                          ],
                        ],
                      ),
              ),

              _Section(
                title: l.myPills,
                action: TextButton.icon(
                  onPressed: () => _addPillDialog(context, prefs),
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(l.add),
                ),
                child: prefs.customPills.isEmpty
                    ? _Hint(l.myPillsHint)
                    : Column(
                        children: [
                          for (final p in prefs.customPills)
                            Dismissible(
                              key: ValueKey(p.id),
                              direction: DismissDirection.endToStart,
                              background: _deleteBg(),
                              onDismissed: (_) => prefs.removeCustomPill(p.id),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: PillCard(pillola: p, compact: true),
                              ),
                            ),
                        ],
                      ),
              ),

              _Section(
                title: l.favSounds,
                trailing: '${videoSalvati.length}',
                child: videoSalvati.isEmpty
                    ? _Hint(l.favSoundsHint)
                    : Column(
                        children: [
                          for (final v in videoSalvati) VideoTile(video: v),
                        ],
                      ),
              ),

              _Section(
                title: l.myVideos,
                action: TextButton.icon(
                  onPressed: () => _addVideoDialog(context, prefs),
                  icon: const Icon(Icons.add_link, size: 18),
                  label: Text(l.addLink),
                ),
                child: prefs.customVideos.isEmpty
                    ? _Hint(l.myVideosHint)
                    : Column(
                        children: [
                          for (final v in prefs.customVideos)
                            Dismissible(
                              key: ValueKey(v.id),
                              direction: DismissDirection.endToStart,
                              background: _deleteBg(),
                              onDismissed: (_) => prefs.removeCustomVideo(v.id),
                              child: VideoTile(video: v),
                            ),
                        ],
                      ),
              ),

              _Section(
                title: l.sleepTimer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Hint(l.sleepTimerHint),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final m in const [0, 15, 30, 45, 60, 90])
                          ChoiceChip(
                            label: Text(switch (m) {
                              0 => l.sleepOff,
                              60 => l.oneHour,
                              90 => l.oneHourHalf,
                              _ => l.minutesShort(m),
                            }),
                            selected: prefs.sleepMinutes == m,
                            onSelected: (_) {
                              prefs.setSleepMinutes(m);
                              final player = AppScope.of(context).player;
                              if (player.hasVideo) player.startSleepTimer(m);
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              _Section(
                title: l.favScene,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SceneRow(
                      label: l.sceneColors,
                      scenes: scene,
                      prefs: prefs,
                    ),
                    if (sceneFoto(AppScope.of(context).images).isNotEmpty) ...[
                      const SizedBox(height: 10),
                      _SceneRow(
                        label: l.scenePhoto,
                        scenes: sceneFoto(AppScope.of(context).images),
                        prefs: prefs,
                      ),
                    ],
                  ],
                ),
              ),

              _Section(
                title: l.vibration,
                child: SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: prefs.haptics,
                  onChanged: prefs.setHaptics,
                  title: Text(l.vibrationTitle),
                  subtitle: Text(
                    l.vibrationSubtitle,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              _Section(
                title: l.voiceGuide,
                action: TextButton.icon(
                  onPressed: () => _chooseVoice(context, prefs),
                  icon: const Icon(Icons.tune, size: 18),
                  label: Text(l.chooseVoice),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      value: prefs.voiceGuide,
                      onChanged: prefs.setVoiceGuide,
                      title: Text(l.voiceGuideTitle),
                      subtitle: Text(
                        l.voiceGuideSubtitle,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    _Hint(Platform.isIOS ? l.voiceHintIos : l.voiceHintAndroid),
                  ],
                ),
              ),

              _Section(
                title: l.language,
                child: Wrap(
                  spacing: 8,
                  children: [
                    ChoiceChip(
                      label: Text(l.languageSystem),
                      selected: prefs.languageCode.isEmpty,
                      onSelected: (_) => prefs.setLanguageCode(''),
                    ),
                    for (final e in kLanguageNames.entries)
                      ChoiceChip(
                        label: Text(e.value),
                        selected: prefs.languageCode == e.key,
                        onSelected: (_) => prefs.setLanguageCode(e.key),
                      ),
                  ],
                ),
              ),

              _Section(title: l.info, child: _Hint(l.infoText)),
            ],
          );
        },
      ),
    );
  }

  Future<void> _chooseVoice(BuildContext context, AppPrefs prefs) async {
    final scope = AppScope.of(context);
    final lang = context.lang;
    final voices = await scope.voice.voicesFor(lang);
    if (!context.mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      builder: (_) => _VoiceSheet(
        voices: voices,
        lang: lang,
        prefs: prefs,
        voice: scope.voice,
      ),
    );
  }

  static Widget _deleteBg() => Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20, bottom: 10),
    decoration: BoxDecoration(
      color: AppColors.danger.withValues(alpha: 0.25),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Icon(Icons.delete_outline, color: AppColors.danger),
  );

  Future<void> _addPillDialog(BuildContext context, AppPrefs prefs) async {
    final l = context.l10n;
    final testo = TextEditingController();
    final fonte = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l.newPill),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: testo,
              autofocus: true,
              maxLines: 4,
              minLines: 2,
              maxLength: 240,
              decoration: InputDecoration(hintText: l.pillTextHint),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: fonte,
              decoration: InputDecoration(hintText: l.pillSourceHint),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l.save),
          ),
        ],
      ),
    );
    if (ok == true && testo.text.trim().isNotEmpty) {
      await prefs.addCustomPill(testo.text, fonte: fonte.text);
    }
  }

  Future<void> _addVideoDialog(BuildContext context, AppPrefs prefs) async {
    final l = context.l10n;
    final url = TextEditingController();
    var categoria = asmrCategorie.first.id;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(l.addYoutubeVideo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: url,
                autofocus: true,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(hintText: l.youtubeLinkHint),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: categoria,
                decoration: InputDecoration(labelText: l.category),
                items: [
                  for (final c in asmrCategorie)
                    DropdownMenuItem(
                      value: c.id,
                      child: Text(l.categoryName(c.id)),
                    ),
                  DropdownMenuItem(
                    value: categoriaMiei.id,
                    child: Text(l.categoryName(categoriaMiei.id)),
                  ),
                ],
                onChanged: (v) => setState(() => categoria = v ?? categoria),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l.add),
            ),
          ],
        ),
      ),
    );
    if (ok != true) return;
    final id = AsmrVideo.parseId(url.text);
    if (!context.mounted) return;
    if (id == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.linkNotRecognized)));
      return;
    }
    final info = await fetchYoutubeInfo(id);
    await prefs.addCustomVideo(
      AsmrVideo(
        id: id,
        titolo: LText.same(info?.title ?? 'YouTube'),
        autore: info?.author ?? '',
        categoriaId: categoria,
        custom: true,
      ),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          info == null ? l.addedNoTitle : l.addedWithTitle(info.title),
        ),
      ),
    );
  }
}

/// Elenco delle voci di sistema per la lingua corrente, con anteprima.
class _VoiceSheet extends StatelessWidget {
  const _VoiceSheet({
    required this.voices,
    required this.lang,
    required this.prefs,
    required this.voice,
  });

  final List<VoiceInfo> voices;
  final String lang;
  final AppPrefs prefs;
  final VoiceGuide voice;

  Future<void> _select(String id) async {
    await prefs.setVoiceId(lang, id);
    await voice.setLanguage(lang, preferredVoiceId: id.isEmpty ? null : id);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListenableBuilder(
      listenable: prefs,
      builder: (context, _) {
        final current = prefs.voiceId(lang);
        String quality(VoiceInfo v) => switch (v.quality) {
          3 => l.voiceQualityPremium,
          2 => l.voiceQualityEnhanced,
          _ => l.voiceQualityBase,
        };
        return SafeArea(
          child: RadioGroup<String>(
            groupValue: current,
            onChanged: (v) => _select(v ?? ''),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    l.chooseVoice,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (voice.hasClip(lang, VoiceGuide.inhale))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Text(
                      l.voiceClipsInUse,
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 12.5,
                        height: 1.4,
                      ),
                    ),
                  ),
                RadioListTile<String>(value: '', title: Text(l.voiceAuto)),
                if (voices.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l.voiceNone,
                      style: const TextStyle(color: AppColors.muted),
                    ),
                  ),
                if (voices.isNotEmpty && voices.every((v) => v.quality < 2))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                    child: Text(
                      Platform.isIOS ? l.voiceHintIos : l.voiceHintAndroid,
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 12.5,
                        height: 1.4,
                      ),
                    ),
                  ),
                for (final v in voices)
                  RadioListTile<String>(
                    value: v.id,
                    title: Text(v.name),
                    subtitle: Text(
                      [
                        quality(v),
                        if (v.gender.isNotEmpty) v.gender,
                        if (v.networkRequired) 'online',
                      ].join(' · '),
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                    secondary: IconButton(
                      tooltip: l.voiceOn,
                      icon: const Icon(
                        Icons.play_circle_outline,
                        color: AppColors.accent,
                      ),
                      onPressed: () async {
                        await voice.setLanguage(lang, preferredVoiceId: v.id);
                        await voice.preview(
                          '${l.phaseInhale}… ${l.phaseHold}… ${l.phaseExhale}.',
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Card "offrimi un caffè": in cima a Oasi, visibile senza scorrere.
class _DonateCard extends StatelessWidget {
  const _DonateCard();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withValues(alpha: 0.22),
            AppColors.accent2.withValues(alpha: 0.14),
          ],
        ),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.donateHint,
            style: const TextStyle(fontSize: 13.5, height: 1.4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => launchUrl(
                    Uri.parse(kDonateUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  icon: const Icon(Icons.coffee),
                  label: Text(l.buyMeCoffee),
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                tooltip: l.contactMe,
                onPressed: () => launchUrl(
                  Uri(
                    scheme: 'mailto',
                    path: kContactEmail,
                    queryParameters: {'subject': 'Libera la Mente'},
                  ),
                ),
                icon: const Icon(Icons.mail_outline, color: AppColors.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SceneRow extends StatelessWidget {
  const _SceneRow({
    required this.label,
    required this.scenes,
    required this.prefs,
  });
  final String label;
  final List<CalmSceneDef> scenes;
  final AppPrefs prefs;

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
        for (final s in scenes)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SceneDot(
              scene: s,
              size: 40,
              selected: s.id == prefs.sceneId,
              onTap: () => prefs.setSceneId(s.id),
            ),
          ),
      ],
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.prefs});
  final AppPrefs prefs;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    Widget stat(String value, String label, IconData icon) => Expanded(
      child: Column(
        children: [
          Icon(icon, color: AppColors.accent, size: 20),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.muted),
          ),
        ],
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          stat(
            '${prefs.totalSessions}',
            l.statSessions,
            Icons.self_improvement,
          ),
          stat('${prefs.totalMinutes}', l.statMinutes, Icons.timer_outlined),
          stat(
            '${prefs.streak}',
            l.statStreak,
            Icons.local_fire_department_outlined,
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.child,
    this.trailing,
    this.action,
  });

  final String title;
  final Widget child;
  final String? trailing;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    trailing!,
                    style: const TextStyle(color: AppColors.muted),
                  ),
                ],
                const Spacer(),
                ?action,
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.muted,
          fontSize: 13,
          height: 1.4,
        ),
      ),
    );
  }
}
