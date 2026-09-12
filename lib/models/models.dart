import 'package:flutter/material.dart';

/// Testo con una versione per lingua. Le lingue supportate oggi sono
/// italiano e inglese; per aggiungerne altre basta [more] (es. `{'es': ...}`),
/// con l'inglese come fallback.
class LText {
  const LText(this.it, this.en, {this.more = const {}});
  const LText.same(String s) : it = s, en = s, more = const {};

  final String it;
  final String en;
  final Map<String, String> more;

  String of(String lang) => switch (lang) {
    'it' => it,
    'en' => en,
    _ => more[lang] ?? en,
  };

  String get(BuildContext context) =>
      of(Localizations.localeOf(context).languageCode);
}

/// Tipo di pillola: originale dell'app, citazione di un classico di pubblico
/// dominio, idea ispirata a un libro moderno (parafrasi con fonte), oppure
/// scritta dall'utente.
enum TipoPillola { originale, classico, ispirata, personale }

class Pillola {
  const Pillola({
    required this.id,
    required this.testo,
    required this.tema,
    this.tipo = TipoPillola.originale,
    this.autore,
    this.fonte,
  });

  final String id;
  final LText testo;
  final String tema;
  final TipoPillola tipo;
  final String? autore;

  /// Titolo dell'opera (tradotto: le edizioni hanno titoli diversi).
  final LText? fonte;

  Map<String, dynamic> toJson() => {
    'id': id,
    'testo': testo.it,
    'tema': tema,
    'tipo': tipo.name,
    'autore': autore,
    'fonte': fonte?.it,
  };

  factory Pillola.fromJson(Map<String, dynamic> j) {
    final fonte = j['fonte'] as String?;
    return Pillola(
      id: j['id'] as String,
      testo: LText.same(j['testo'] as String),
      tema: (j['tema'] as String?) ?? 'personale',
      tipo: TipoPillola.values.firstWhere(
        (t) => t.name == j['tipo'],
        orElse: () => TipoPillola.personale,
      ),
      autore: j['autore'] as String?,
      fonte: fonte == null || fonte.isEmpty ? null : LText.same(fonte),
    );
  }
}

class AsmrCategory {
  const AsmrCategory({
    required this.id,
    required this.icona,
    required this.colori,
    this.calmante = false,
  });

  /// Chiave stabile; nome e descrizione tradotti stanno in AppLocalizations
  /// (vedi `categoryName` / `categoryDesc` in l10n/l10n_ext.dart).
  final String id;
  final IconData icona;

  /// Coppia di colori per il gradiente della card.
  final List<Color> colori;

  /// True per le categorie adatte al "Quick start" (suoni continui, senza voce).
  final bool calmante;
}

class AsmrVideo {
  const AsmrVideo({
    required this.id,
    required this.titolo,
    required this.autore,
    required this.categoriaId,
    this.custom = false,
  });

  final String id;
  final LText titolo;
  final String autore;
  final String categoriaId;
  final bool custom;

  String get thumbnail => 'https://img.youtube.com/vi/$id/mqdefault.jpg';
  String get url => 'https://www.youtube.com/watch?v=$id';

  Map<String, dynamic> toJson() => {
    'id': id,
    'titolo': titolo.it,
    'autore': autore,
    'categoriaId': categoriaId,
  };

  factory AsmrVideo.fromJson(Map<String, dynamic> j) => AsmrVideo(
    id: j['id'] as String,
    titolo: LText.same(j['titolo'] as String),
    autore: (j['autore'] as String?) ?? '',
    categoriaId: (j['categoriaId'] as String?) ?? 'miei',
    custom: true,
  );

  /// Estrae l'ID da un link YouTube (watch, youtu.be, shorts, embed) o da un ID nudo.
  static String? parseId(String input) {
    final s = input.trim();
    final bare = RegExp(r'^[A-Za-z0-9_-]{11}$');
    if (bare.hasMatch(s)) return s;
    final patterns = [
      RegExp(r'[?&]v=([A-Za-z0-9_-]{11})'),
      RegExp(r'youtu\.be/([A-Za-z0-9_-]{11})'),
      RegExp(r'/shorts/([A-Za-z0-9_-]{11})'),
      RegExp(r'/embed/([A-Za-z0-9_-]{11})'),
      RegExp(r'/live/([A-Za-z0-9_-]{11})'),
    ];
    for (final p in patterns) {
      final m = p.firstMatch(s);
      if (m != null) return m.group(1);
    }
    return null;
  }
}

class CalmSceneDef {
  const CalmSceneDef({
    required this.id,
    required this.gradiente,
    required this.blob,
    required this.prompt,
    this.foto = false,
  });

  /// Chiave stabile: `alba` per la versione a colori, `foto_alba` per quella
  /// con l'immagine IA. Il nome tradotto è in AppLocalizations (`sceneName`).
  final String id;

  /// True se questa variante mostra l'immagine sopra il gradiente.
  final bool foto;

  /// Id della scena base (senza il prefisso `foto_`).
  String get baseId => foto ? id.substring(5) : id;

  /// La stessa scena con l'immagine IA.
  CalmSceneDef get conFoto => CalmSceneDef(
    id: 'foto_$id',
    gradiente: gradiente,
    blob: blob,
    prompt: prompt,
    foto: true,
  );

  /// Tre colori dall'alto verso il basso.
  final List<Color> gradiente;

  /// Colori delle "nuvole" morbide che fluttuano sopra il gradiente.
  final List<Color> blob;

  /// Prompt suggerito per generare l'immagine con l'IA.
  final String prompt;

  String get asset => 'assets/images/scene_$baseId.jpg';
}

/// Stato d'animo → combinazione consigliata di scena, suono e ritmo.
class Mood {
  const Mood({
    required this.id,
    required this.emoji,
    required this.sceneId,
    required this.categoriaId,
    required this.lato,
  });

  /// Chiave stabile; il nome tradotto è in AppLocalizations (`moodName`).
  final String id;
  final String emoji;
  final String sceneId;
  final String categoriaId;

  /// Secondi per lato del quadrato.
  final int lato;
}
