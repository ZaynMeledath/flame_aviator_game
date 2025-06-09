import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 20000));

    animation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(animationController);

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController
          ..reset()
          ..forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final radius = screenSize.width * 1.5;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: screenSize.height * .45,
          color: Colors.black,
          child: Stack(
            children: [
              AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Positioned(
                      left: -radius,
                      bottom: -radius,
                      child: Transform.rotate(
                        angle: math.pi * animation.value,
                        child: CustomPaint(
                          size: Size(radius * 2, radius * 2),
                          painter: PiePainter(
                            sweepAngle: math.pi / 20,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class PiePainter extends CustomPainter {
  final double sweepAngle;

  bool repaint = true;

  PiePainter({
    required this.sweepAngle,
  });

  final gradientColors = [
    Colors.purple.withAlpha(200),
    Colors.purple.withAlpha(80),
    Colors.purple.withAlpha(1),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final int totalSegments = (2 * math.pi / sweepAngle).abs().ceil();
    for (int i = 0; i < totalSegments; i++) {
      final segmentStart = sweepAngle * i * 2;
      final dx = center.dx + radius * math.cos(segmentStart + sweepAngle / 2);
      final dy = center.dy + radius * math.sin(segmentStart + sweepAngle / 2);
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
          segmentStart,
          sweepAngle,
          false,
        )
        ..close();
      canvas.drawPath(path, paint);
    }
    repaint = false;
  }

  @override
  bool shouldRepaint(PiePainter oldDelegate) {
    return oldDelegate.repaint;
  }
}
