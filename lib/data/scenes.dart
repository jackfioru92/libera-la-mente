import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/app_scope.dart';

/// Scene visive (nomi tradotti in lib/l10n/app_*.arb, chiavi scene*). Ogni scena ha un gradiente procedurale (sempre disponibile)
/// e, se presente in `assets/images/scene_<id>.jpg`, un'immagine generata con
/// l'IA che viene mostrata sopra il gradiente. Vedi assets/images/README.md.
const List<CalmSceneDef> scene = [
  CalmSceneDef(
    id: 'alba',
    gradiente: [Color(0xFF2B1E3A), Color(0xFF6E3F5C), Color(0xFFE58C6A)],
    blob: [Color(0xFFF2B27A), Color(0xFFD97B8A), Color(0xFF8C6BB1)],
    prompt:
        'soft dreamy sunrise over misty hills, pastel peach and lavender sky, '
        'no people, minimal, matte painting, gentle light, calm, vertical 9:16',
  ),
  CalmSceneDef(
    id: 'pioggia',
    gradiente: [Color(0xFF0D1B2A), Color(0xFF1B3A4B), Color(0xFF5C8AA8)],
    blob: [Color(0xFF7FB3D5), Color(0xFF3E6D8C), Color(0xFFE8C48A)],
    prompt:
        'cozy window with raindrops at dusk, warm lamp light inside, blurred '
        'blue city lights outside, lo-fi anime style, calm, vertical 9:16',
  ),
  CalmSceneDef(
    id: 'foresta',
    gradiente: [Color(0xFF0B1F1A), Color(0xFF1F4D3A), Color(0xFF7BA37F)],
    blob: [Color(0xFF9BC7A4), Color(0xFF4F8A64), Color(0xFFD8E2B0)],
    prompt:
        'quiet pine forest in soft morning fog, light rays between trees, '
        'muted green palette, minimal, serene, vertical 9:16',
  ),
  CalmSceneDef(
    id: 'notte',
    gradiente: [Color(0xFF05070F), Color(0xFF141A3A), Color(0xFF4A3E8C)],
    blob: [Color(0xFF6C63C9), Color(0xFF2E3A8C), Color(0xFFB8A8F0)],
    prompt:
        'calm night sky with soft stars over a still lake, deep indigo and '
        'violet, minimal, dreamy, no text, vertical 9:16',
  ),
  CalmSceneDef(
    id: 'oceano',
    gradiente: [Color(0xFF061826), Color(0xFF0E4C6E), Color(0xFF56A3C7)],
    blob: [Color(0xFF7CC4E0), Color(0xFF1F6F8F), Color(0xFFBFE6F2)],
    prompt:
        'calm ocean at blue hour, long exposure, silky smooth water, soft '
        'gradient sky, minimal, peaceful, vertical 9:16',
  ),
  CalmSceneDef(
    id: 'lavanda',
    gradiente: [Color(0xFF1C1530), Color(0xFF4B3A78), Color(0xFFB39DDB)],
    blob: [Color(0xFFCDB4F0), Color(0xFF7A5FB5), Color(0xFFF2C9A0)],
    prompt:
        'lavender field at golden hour, soft focus, warm and purple tones, '
        'minimal, peaceful, no people, vertical 9:16',
  ),
];

/// Versioni "foto" delle scene per cui esiste l'immagine in assets.
List<CalmSceneDef> sceneFoto(SceneImages images) => [
  for (final s in scene)
    if (images.has(s.asset)) s.conFoto,
];

/// Tutte le scene selezionabili: prima i colori, poi le foto.
List<CalmSceneDef> tutteLeScene(SceneImages images) => [
  ...scene,
  ...sceneFoto(images),
];

CalmSceneDef scenaById(String id, SceneImages images) =>
    tutteLeScene(images)
        .firstWhere((s) => s.id == id, orElse: () => scene.first);

/// Stati d'animo per la schermata Oggi.
const List<Mood> moods = [
  Mood(
    id: 'ansioso',
    emoji: '🌧️',
    sceneId: 'pioggia',
    categoriaId: 'pioggia',
    lato: 4,
  ),
  Mood(
    id: 'insonne',
    emoji: '🌙',
    sceneId: 'notte',
    categoriaId: 'bianco',
    lato: 5,
  ),
  Mood(
    id: 'sovraccarico',
    emoji: '🌲',
    sceneId: 'foresta',
    categoriaId: 'foresta',
    lato: 4,
  ),
  Mood(
    id: 'agitato',
    emoji: '🌊',
    sceneId: 'oceano',
    categoriaId: 'onde',
    lato: 6,
  ),
  Mood(id: 'giu', emoji: '🔥', sceneId: 'alba', categoriaId: 'fuoco', lato: 4),
  Mood(
    id: 'distratto',
    emoji: '📚',
    sceneId: 'lavanda',
    categoriaId: 'lofi',
    lato: 4,
  ),
];
