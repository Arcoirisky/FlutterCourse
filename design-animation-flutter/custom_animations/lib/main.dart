import 'package:custom_animations/src/pages/animaciones_page.dart';
// import 'package:custom_animations/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animaciones',
      home: Scaffold(
        body: AnimacionesPage(),
      ),
    );
  }
}
