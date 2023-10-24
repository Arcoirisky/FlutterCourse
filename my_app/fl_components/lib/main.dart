import 'package:flutter/material.dart';
import 'package:fl_components/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        '/': (_) => const HomeScreen(),
        'listview2': (_) => const Listview2Screen(),
        'listview1': (_) => const Listview1Screen(),
        'alert': (_) => const AlertScreen(),
        'card': (_) => const CardScreen(),
      },
    );
  }
}
