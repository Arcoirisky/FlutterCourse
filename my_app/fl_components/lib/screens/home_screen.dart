import 'package:fl_components/models/models.dart';
import 'package:fl_components/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 0,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final option = menuOptions[index];
            return ListTile(
              leading: Icon(option.icon),
              title: Text(option.name),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => Navigator.pushNamed(context, option.route),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOptions.length),
    );
  }
}
