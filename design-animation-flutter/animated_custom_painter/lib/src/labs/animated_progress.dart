import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedProgressScreen extends StatefulWidget {
  const AnimatedProgressScreen({super.key});

  @override
  State<AnimatedProgressScreen> createState() => _AnimatedProgressScreenState();
}

class _AnimatedProgressScreenState extends State<AnimatedProgressScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isForward = true; // Indicador de la dirección de la animación

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isForward = !isForward;
          });
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            isForward = !isForward;
          });
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _CircularProgressPainter(
              progress: animation.value,
              isForward: isForward,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final bool isForward;

  _CircularProgressPainter({required this.progress, required this.isForward});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final foregroundPaint = Paint()
      ..color = Colors.pink
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double arcAngle = 2 * pi * progress;

    // Dibuja el círculo de fondo
    canvas.drawCircle(center, radius, backgroundPaint);

    // Dibuja el arco de progreso
    if (isForward) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        arcAngle,
        false,
        foregroundPaint,
      );
    } else {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        -arcAngle,
        false,
        foregroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.isForward != isForward;
  }
}
