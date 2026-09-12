import 'package:flutter/material.dart';

import '../theme.dart';

/// Il quadrato del respiro: un punto luminoso percorre i quattro lati (uno per
/// fase) mentre un quadrato interno si espande e si contrae con il respiro.
class BreathingBox extends StatelessWidget {
  const BreathingBox({
    super.key,
    required this.phase,
    required this.phaseProgress,
    required this.breath,
    required this.secondsLeft,
    required this.running,
    required this.label,
    this.size = 260,
  });

  /// 0 inspira, 1 trattieni, 2 espira, 3 trattieni.
  final int phase;

  /// Avanzamento della fase corrente, 0..1.
  final double phaseProgress;

  /// Quanto sono "pieni" i polmoni, 0..1.
  final double breath;
  final int secondsLeft;
  final bool running;

  /// Testo al centro: la fase corrente, oppure "Pronto".
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BoxPainter(
          phase: phase,
          phaseProgress: phaseProgress,
          breath: breath,
          running: running,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: Text(
                  label,
                  key: ValueKey(label),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: AppColors.text,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                running ? '$secondsLeft' : '',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w200,
                  color: AppColors.text.withValues(alpha: 0.85),
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BoxPainter extends CustomPainter {
  _BoxPainter({
    required this.phase,
    required this.phaseProgress,
    required this.breath,
    required this.running,
  });

  final int phase;
  final double phaseProgress;
  final double breath;
  final bool running;

  @override
  void paint(Canvas canvas, Size size) {
    final side = size.shortestSide * 0.82;
    final origin = Offset((size.width - side) / 2, (size.height - side) / 2);
    final outer = origin & Size(side, side);
    const radius = Radius.circular(28);

    // Quadrato interno che respira.
    final innerSide = side * (0.50 + 0.36 * breath);
    final inner = Rect.fromCenter(
      center: outer.center,
      width: innerSide,
      height: innerSide,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(inner, Radius.circular(22 + 10 * breath)),
      Paint()
        ..shader = RadialGradient(
          colors: [
            AppColors.accent.withValues(alpha: 0.30 + 0.25 * breath),
            AppColors.accent2.withValues(alpha: 0.10 + 0.10 * breath),
            Colors.transparent,
          ],
          stops: const [0, 0.7, 1],
        ).createShader(inner.inflate(inner.width * 0.4)),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(inner, Radius.circular(22 + 10 * breath)),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = Colors.white.withValues(alpha: 0.18 + 0.22 * breath),
    );

    // Contorno del quadrato esterno.
    canvas.drawRRect(
      RRect.fromRectAndRadius(outer, radius),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withValues(alpha: 0.22),
    );

    if (!running) return;

    // Lato corrente: parte percorsa evidenziata.
    final path = Path();
    final tl = outer.topLeft, tr = outer.topRight;
    final br = outer.bottomRight, bl = outer.bottomLeft;
    late Offset start, end;
    switch (phase) {
      case 0:
        start = tl;
        end = tr;
      case 1:
        start = tr;
        end = br;
      case 2:
        start = br;
        end = bl;
      default:
        start = bl;
        end = tl;
    }
    final pos = Offset.lerp(start, end, phaseProgress)!;
    path.moveTo(start.dx, start.dy);
    path.lineTo(pos.dx, pos.dy);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..color = AppColors.accent.withValues(alpha: 0.9),
    );

    // Punto luminoso con alone.
    canvas.drawCircle(
      pos,
      22,
      Paint()
        ..shader = RadialGradient(
          colors: [
            AppColors.accent.withValues(alpha: 0.55),
            AppColors.accent.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: pos, radius: 22)),
    );
    canvas.drawCircle(pos, 7, Paint()..color = AppColors.accent);
    canvas.drawCircle(pos, 3, Paint()..color = Colors.white);

    // Pallini agli angoli: fasi completate nel ciclo corrente.
    final corners = [tl, tr, br, bl];
    for (var i = 0; i < 4; i++) {
      final done = i <= phase;
      canvas.drawCircle(
        corners[i],
        4,
        Paint()
          ..color = done
              ? AppColors.accent.withValues(alpha: 0.9)
              : Colors.white.withValues(alpha: 0.25),
      );
    }
  }

  @override
  bool shouldRepaint(_BoxPainter old) =>
      old.phase != phase ||
      old.phaseProgress != phaseProgress ||
      old.breath != breath ||
      old.running != running;
}

/// Curva "polmoni": morbida all'inizio e alla fine di ogni fase.
double breathCurve(double t) => Curves.easeInOutSine.transform(t.clamp(0, 1));

/// Utility: da un valore 0..1 sull'intero ciclo ricava fase, avanzamento e
/// quantità di respiro.
({int phase, double progress, double breath}) breathState(double cycle) {
  final v = (cycle * 4).clamp(0.0, 3.999999);
  final phase = v.floor();
  final progress = v - phase;
  final breath = switch (phase) {
    0 => breathCurve(progress),
    1 => 1.0,
    2 => 1 - breathCurve(progress),
    _ => 0.0,
  };
  return (phase: phase, progress: progress, breath: breath);
}

/// Piccola icona quadrata usata nel logo/titolo.
class BoxGlyph extends StatelessWidget {
  const BoxGlyph({super.key, this.size = 18, this.color = AppColors.accent});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.28),
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: Container(
          width: size * 0.35,
          height: size * 0.35,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size * 0.1),
          ),
        ),
      ),
    );
  }
}
