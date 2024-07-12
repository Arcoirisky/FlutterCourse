import 'package:animated_custom_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesScreen extends StatefulWidget {
  const GraficasCircularesScreen({super.key});

  @override
  State<GraficasCircularesScreen> createState() =>
      _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.refresh, color: Colors.white),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgress(
                  porcentaje: porcentaje, color: Colors.purple),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink),
              CustomRadialProgress(
                  porcentaje: porcentaje, color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    this.color = Colors.red,
  });

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
      ),
    );
  }
}
