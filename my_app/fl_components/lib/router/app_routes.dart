import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {
  static const initialRouter = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: '/',
        name: 'Home Screen',
        screen: const HomeScreen(),
        icon: Icons.home_max_sharp),
    MenuOption(
        route: 'listview1',
        name: 'ListView tipo 1',
        screen: const Listview1Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: 'listview2',
        name: 'ListView tipo 2',
        screen: const Listview2Screen(),
        icon: Icons.list),
    MenuOption(
        route: 'alert',
        name: 'Alert Screen',
        screen: const AlertScreen(),
        icon: Icons.notifications),
    MenuOption(
        route: 'card',
        name: 'Card Screen',
        screen: const CardScreen(),
        icon: Icons.credit_card),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (_) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (_) => const HomeScreen(),
  //   'listview2': (_) => const Listview2Screen(),
  //   'listview1': (_) => const Listview1Screen(),
  //   'alert': (_) => const AlertScreen(),
  //   'card': (_) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}