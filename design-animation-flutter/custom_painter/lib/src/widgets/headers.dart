import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class HeaderDiagonalFail extends StatelessWidget {
  const HeaderDiagonalFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.1,
      child: Container(
        height: 300,
        width: 5000,
        color: const Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderDiagonalPainter(),
      child: Container(
        height: double.infinity,
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // Lapiz

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke
    paint.strokeWidth = 2;

    final path = Path();

    // Draw with the path and the paint
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderTrianguloPainter(),
      child: Container(
        height: double.infinity,
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke
    paint.strokeWidth = 2;

    final path = Path();

    // Draw with the path and the paint
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderPicoPainter(),
      child: Container(
        height: double.infinity,
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke
    paint.strokeWidth = 2;

    final path = Path();

    // Draw with the path and the paint
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderCurvoPainter(),
      child: Container(
        height: double.infinity,
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke
    paint.strokeWidth = 2;

    final path = Path();

    // Draw with the path and the paint
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5, // Control point
      size.height * 0.4, // <0.25 la curva va hacia arriba >0.25 va hacia abajo
      size.width, // End point
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderWavesPainter(),
      child: Container(
        height: double.infinity,
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke
    paint.strokeWidth = 2;

    final path = Path();
    const percent = 0.75;
    // Draw with the path and the paint
    path.moveTo(0, size.height);
    // path.moveTo(0, size.height);
    path.lineTo(0, size.height * percent);
    path.quadraticBezierTo(
      size.width * 0.25, // Control point
      size.height * (percent + 0.1),
      // <0.25 la curva va hacia arriba >0.25 va hacia abajo
      size.width * 0.5, // End point
      size.height * percent,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (percent - 0.1),
      size.width,
      size.height * percent,
    );
    path.lineTo(size.width, size.height);
    //path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderWavesGradient(),
      child: Container(
        height: double.infinity,
      ),
    );
  }
}

class _HeaderWavesGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ]);
    final Rect rect = Rect.fromCircle(
      center: Offset(0, size.height * 0.75),
      radius: 180,
    );
    final paint = Paint()..shader = gradiente.createShader(rect);

    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    const percent = 0.75;
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * percent);
    path.quadraticBezierTo(
      size.width * 0.25, // Control point
      size.height * (percent + 0.1),
      size.width * 0.5, // End point
      size.height * percent,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (percent - 0.1),
      size.width,
      size.height * percent,
    );
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
