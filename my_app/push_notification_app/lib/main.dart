import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const HomeScreen(),
        "/message": (_) => const MessageScreen(),
      },
    );
  }
}
