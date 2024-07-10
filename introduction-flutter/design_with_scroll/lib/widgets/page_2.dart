import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
          child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0098FA),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 40)),
        child: const Text('Bienvenido',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        onPressed: () {},
      )),
    );
  }
}
