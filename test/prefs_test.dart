import 'package:calma_la_mente/services/prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('le pillole preferite sopravvivono a un riavvio', () async {
    final prima = await AppPrefs.load();
    await prima.toggleFavPill('o01');
    await prima.toggleFavPill('c03');
    await prima.toggleFavPill('o01'); // tolta di nuovo
    await prima.toggleFavVideo('Hvtc9BWahMQ');
    await prima.addCustomPill('Una frase mia', fonte: 'Io');

    // Nuova istanza = app riaperta: rilegge da disco.
    final dopo = await AppPrefs.load();
    expect(dopo.isFavPill('c03'), isTrue);
    expect(dopo.isFavPill('o01'), isFalse);
    expect(dopo.isFavVideo('Hvtc9BWahMQ'), isTrue);
    expect(dopo.customPills.single.testo.it, 'Una frase mia');
    expect(dopo.customPills.single.fonte?.it, 'Io');
  });

  test('sessioni e serie di giorni', () async {
    final p = await AppPrefs.load();
    await p.recordSession(3);
    await p.recordSession(5); // stesso giorno: la serie resta 1
    expect(p.totalSessions, 2);
    expect(p.totalMinutes, 8);
    expect(p.streak, 1);
  });
}
