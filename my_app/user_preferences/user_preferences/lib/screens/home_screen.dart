import 'package:flutter/material.dart';
import 'package:user_preferences/share_preferences/preferences.dart';
import 'package:user_preferences/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
                'Color secundario: ${Preferences.isDarkmode ? 'Dark mode' : 'Light mode'}'),
            const Divider(height: 20),
            Text(
                'Genero: ${Preferences.gender == 1 ? 'Masculino' : 'Femenino'}'),
            const Divider(height: 20),
            Text('Nombre de usuario: ${Preferences.name}'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
