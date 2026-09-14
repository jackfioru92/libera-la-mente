import 'package:calma_la_mente/config.dart';
import 'package:calma_la_mente/l10n/app_localizations.dart';
import 'package:calma_la_mente/screens/oasi_screen.dart';
import 'package:calma_la_mente/services/app_scope.dart';
import 'package:calma_la_mente/services/asmr_player.dart';
import 'package:calma_la_mente/services/prefs.dart';
import 'package:calma_la_mente/services/sound_mixer.dart';
import 'package:calma_la_mente/services/voice_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Oasi mostra il bottone donazioni e il contatto', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPrefs.load();
    final player = AsmrPlayer();
    addTearDown(player.dispose);

    await tester.pumpWidget(
      AppScope(
        prefs: prefs,
        player: player,
        nav: AppController(),
        images: const SceneImages.none(),
        voice: VoiceGuide(),
        mixer: SoundMixer(loadVolumes: () => null, saveVolumes: (_) {}),
        child: const MaterialApp(
          locale: Locale('it'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(body: OasiScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Deve essere visibile senza scorrere.
    expect(find.text('Offrimi un caffè'), findsOneWidget);
    expect(find.byTooltip('Scrivimi'), findsOneWidget);
    expect(kDonateUrl, contains('fgiacomo92%40gmail.com'));
  });
}
