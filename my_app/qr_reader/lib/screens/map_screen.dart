import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Map page'),
      ),
      bottomNavigationBar: CustomNavigationbar(),
    );
  }
}
