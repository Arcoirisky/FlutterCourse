import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({super.key});

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>
    with SingleTickerProviderStateMixin {
  double porcentaje = 10;
  double nuevoPorcentaje = 0;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    controller.addListener(() {
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(Icons.refresh, color: Colors.pink),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyCircularProgressPainter(porcentaje: porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MyCircularProgressPainter extends CustomPainter {
  final double porcentaje;

  _MyCircularProgressPainter({required this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20;

    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth;

    canvas.drawCircle(
      center, // posicion
      radius, // radio
      paint, // Lapiz
    );

    // Arco
    final paintArc = Paint()
      ..color = Colors.pink
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Parte que se debe llenar
    double arcAngle = 2 * pi * (porcentaje / 100);
    // Dibujo del arco
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(_MyCircularProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_MyCircularProgressPainter oldDelegate) => false;
}
