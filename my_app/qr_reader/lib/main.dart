import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'providers/ui_provider.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'map': (context) => const MapScreen(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.deepPurple,
          ),
          iconTheme: const IconThemeData(
            color: Colors.deepPurple,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.deepPurple,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
