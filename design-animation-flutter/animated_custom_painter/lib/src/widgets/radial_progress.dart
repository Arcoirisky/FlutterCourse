import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyCircularProgressPainter(
              porcentaje: (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * controller.value),
              color: widget.colorPrimario,
              bgColor: widget.colorSecundario,
            ),
          ),
        );
      },
    );
  }
}

class _MyCircularProgressPainter extends CustomPainter {
  final double porcentaje;
  final Color color;
  final Color bgColor;

  _MyCircularProgressPainter({
    required this.porcentaje,
    required this.color,
    required this.bgColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20;

    final paint = Paint()
      ..color = bgColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth;

    canvas.drawCircle(
      center, // posicion
      radius, // radio
      paint, // Lapiz
    );

    Gradient gradient = const LinearGradient(
      colors: <Color>[
        Colors.red,
        Colors.yellow,
        Colors.green,
      ],
    );

    // Arco
    final paintArc = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      // ..color = color
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
