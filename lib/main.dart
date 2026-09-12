import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/asmr_catalog.dart';
import 'l10n/app_localizations.dart';
import 'screens/home_shell.dart';
import 'services/app_scope.dart';
import 'services/asmr_player.dart';
import 'services/prefs.dart';
import 'services/voice_guide.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.surface,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  final prefs = await AppPrefs.load();
  final images = await SceneImages.load();
  final voiceAssets = await VoiceGuide.scanAssets();
  debugPrint('Voice clips: ${voiceAssets.length}');
  runApp(CalmaApp(prefs: prefs, images: images, voiceAssets: voiceAssets));
}

class CalmaApp extends StatefulWidget {
  const CalmaApp({
    super.key,
    required this.prefs,
    required this.images,
    this.voiceAssets = const {},
  });

  final AppPrefs prefs;
  final SceneImages images;
  final Set<String> voiceAssets;

  @override
  State<CalmaApp> createState() => _CalmaAppState();
}

class _CalmaAppState extends State<CalmaApp> {
  final _player = AsmrPlayer();
  final _nav = AppController();
  late final _voice = VoiceGuide(assets: widget.voiceAssets);

  @override
  void initState() {
    super.initState();
    _applyDemoEnv();
  }

  /// Solo in debug, per screenshot e test da riga di comando: se nella
  /// cartella tmp dell'app esiste `demo.json` (es. `{"tab":1,"video":"ID",
  /// "start":true,"lang":"en","scene":"alba"}`), apre quella scheda, avvia quel suono e/o la sessione.
  /// Su simulatore iOS la cartella è
  /// `$(xcrun simctl get_app_container booted <bundle> data)/tmp`.
  void _applyDemoEnv() {
    if (!kDebugMode) return;
    Map<String, dynamic> demo;
    try {
      final f = File('${Directory.systemTemp.path}/demo.json');
      if (!f.existsSync()) return;
      demo = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
    } catch (_) {
      return;
    }
    final tab = demo['tab'];
    if (tab is int) _nav.goTo(tab);
    final lang = demo['lang'];
    if (lang is String) widget.prefs.setLanguageCode(lang);
    final scene = demo['scene'];
    if (scene is String) widget.prefs.setSceneId(scene);
    final videoId = demo['video'] as String?;
    final start = demo['start'] == true;
    if (videoId == null && !start) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (videoId != null) {
        final v = asmrVideos.where((v) => v.id == videoId).firstOrNull;
        if (v != null) _player.play(v, sleepMinutes: widget.prefs.sleepMinutes);
      }
      if (start) _nav.startBreathing();
    });
  }

  @override
  void dispose() {
    _player.dispose();
    _nav.dispose();
    _voice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      prefs: widget.prefs,
      player: _player,
      nav: _nav,
      images: widget.images,
      voice: _voice,
      child: ListenableBuilder(
        listenable: widget.prefs,
        builder: (context, _) {
          final code = widget.prefs.languageCode;
          return MaterialApp(
            onGenerateTitle: (context) => AppLocalizations.of(context).appName,
            debugShowCheckedModeBanner: false,
            theme: buildTheme(),
            locale: code.isEmpty ? null : Locale(code),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const HomeShell(),
          );
        },
      ),
    );
  }
}
