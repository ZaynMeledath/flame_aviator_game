import 'dart:async';
import 'dart:ui';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/components.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart' show Colors;

class LightsBackground extends PositionComponent {
  final sweepAngle = math.pi / 20;

  final gradientColors = [
    Colors.purple.withAlpha(20),
    Colors.purple.withAlpha(70),
    Colors.purple.withAlpha(1),
  ];
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final backgroundSize = (math.max(
            FlyAwayConfig.skyBackground.x, FlyAwayConfig.skyBackground.y)) *
        2.5;
    size = Vector2(
      backgroundSize,
      backgroundSize,
    );
    anchor = Anchor.center;
    position = Vector2(0, FlyAwayConfig.gameHeight);
  }

  @override
  void render(Canvas canvas) {
    final center = Offset(size.x / 2, size.y / 2);
    final radius = math.min(size.x, size.y) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final int totalSegments = (2 * math.pi / sweepAngle).abs().ceil();
    for (int i = 0; i < totalSegments; i++) {
      final startAngle = sweepAngle * i * 2;
      //Calculate the offsets for the gradient
      final dx = center.dx + radius * math.cos(startAngle + sweepAngle / 2);
      final dy = center.dy + radius * math.sin(startAngle + sweepAngle / 2);
      final shader = ui.Gradient.linear(
        center,
        Offset(dx, dy),
        gradientColors,
        [.3, .6, 1],
      );
      final paint = Paint()..shader = shader;
      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(
          rect,
          startAngle,
          sweepAngle,
          false,
        )
        ..close();
      canvas.drawPath(path, paint);
    }
    super.render(canvas);
  }
}
