import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: const Text('Historial'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete_forever_outlined),
        ),
      ],
    );
  }
}
