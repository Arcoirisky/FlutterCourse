import 'package:flutter/material.dart';

class CuadradoAnimadoScreen extends StatelessWidget {
  const CuadradoAnimadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado();

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> movDerecha;
  late Animation<double> movArriba;
  late Animation<double> movIzquierda;
  late Animation<double> movAbajo;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    movDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut),
      ),
    );

    movArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    movIzquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut),
      ),
    );

    movAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: const _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(
            movDerecha.value + movIzquierda.value,
            movArriba.value + movAbajo.value,
          ),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
