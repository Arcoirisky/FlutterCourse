import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          leading: Icon(Icons.photo_album_outlined),
          title: Text('Soy un título'),
          subtitle: Text(
              'Adipisicing ullamco minim non tempor eu sint minim est officia incididunt.Ea laboris occaecat exercitation in qui dolore Lorem sint velit ex nostrud ullamco dolore dolor.'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () {},
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Ok'),
            ),
          ]),
        )
      ],
    ));
  }
}
