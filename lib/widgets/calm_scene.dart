import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../l10n/l10n_ext.dart';
import '../models/models.dart';
import '../services/app_scope.dart';

/// Sfondo "vivo": gradiente + nuvole morbide che fluttuano lentamente.
/// [breath] (0..1) fa espandere e illuminare la scena a ritmo del respiro.
/// Se in assets esiste l'immagine IA della scena, viene mostrata sopra il
/// gradiente e respira anch'essa (leggero zoom).
class CalmScene extends StatefulWidget {
  const CalmScene({
    super.key,
    required this.scene,
    this.breath = 0,
    this.dim = 0.35,
  });

  final CalmSceneDef scene;
  final double breath;

  /// Velatura scura sopra la scena per tenere leggibile il testo.
  final double dim;

  @override
  State<CalmScene> createState() => _CalmSceneState();
}

class _CalmSceneState extends State<CalmScene>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drift = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 40),
  )..repeat();

  @override
  void dispose() {
    _drift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = AppScope.of(context).images;
    final hasImage = widget.scene.foto && images.has(widget.scene.asset);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _drift,
        builder: (context, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: _ScenePainter(
                  scene: widget.scene,
                  t: _drift.value,
                  breath: widget.breath,
                ),
              ),
              if (hasImage)
                Transform.scale(
                  scale: 1.02 + 0.05 * widget.breath,
                  child: Opacity(
                    opacity: 0.85,
                    child: Image.asset(
                      widget.scene.asset,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
              // Velatura: con una foto vera serve più scura, soprattutto in
              // basso dove stanno testo e controlli.
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.45, 1],
                    colors: hasImage
                        ? [
                            Colors.black.withValues(alpha: widget.dim * 0.9),
                            Colors.black.withValues(alpha: widget.dim * 0.55),
                            Colors.black.withValues(
                              alpha: (widget.dim * 1.7).clamp(0, 0.85),
                            ),
                          ]
                        : [
                            Colors.black.withValues(alpha: widget.dim * 0.6),
                            Colors.black.withValues(alpha: widget.dim * 0.25),
                            Colors.black.withValues(alpha: widget.dim),
                          ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ScenePainter extends CustomPainter {
  _ScenePainter({required this.scene, required this.t, required this.breath});

  final CalmSceneDef scene;
  final double t; // 0..1, ciclo lento di deriva
  final double breath; // 0..1

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: scene.gradiente,
        ).createShader(rect),
    );

    final angle = t * 2 * math.pi;
    final base = size.shortestSide;
    final blobs = scene.blob;
    for (var i = 0; i < blobs.length; i++) {
      final phase = angle + i * 2.1;
      final cx = size.width * (0.5 + 0.38 * math.sin(phase * 0.9 + i));
      final cy = size.height * (0.45 + 0.32 * math.cos(phase * 0.7 - i * 0.6));
      final r = base * (0.42 + 0.06 * i) * (0.9 + 0.28 * breath);
      final alpha = 0.32 + 0.16 * breath;
      final center = Offset(cx, cy);
      canvas.drawCircle(
        center,
        r,
        Paint()
          ..shader = RadialGradient(
            colors: [
              blobs[i].withValues(alpha: alpha),
              blobs[i].withValues(alpha: 0),
            ],
          ).createShader(Rect.fromCircle(center: center, radius: r)),
      );
    }
  }

  @override
  bool shouldRepaint(_ScenePainter old) =>
      old.t != t || old.breath != breath || old.scene != scene;
}

/// Pallino-anteprima di una scena, usato nei selettori.
class SceneDot extends StatelessWidget {
  const SceneDot({
    super.key,
    required this.scene,
    required this.selected,
    required this.onTap,
    this.size = 44,
  });

  final CalmSceneDef scene;
  final bool selected;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final hasImage = scene.foto && AppScope.of(context).images.has(scene.asset);
    final l = context.l10n;
    return Tooltip(
      message:
          '${l.sceneName(scene.baseId)} · ${scene.foto ? l.scenePhoto : l.sceneColors}',
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // Con l'immagine IA disponibile il pallino ne mostra la miniatura.
            image: hasImage
                ? DecorationImage(
                    image: AssetImage(scene.asset),
                    fit: BoxFit.cover,
                  )
                : null,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: scene.gradiente,
            ),
            border: Border.all(
              color: selected
                  ? Colors.white.withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.15),
              width: selected ? 2.5 : 1,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: scene.blob.first.withValues(alpha: 0.5),
                      blurRadius: 14,
                    ),
                  ]
                : null,
          ),
        ),
      ),
    );
  }
}
