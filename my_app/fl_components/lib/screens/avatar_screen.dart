import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stan Lee'), actions: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
            child: const Text('SL'),
            backgroundColor: Colors.indigo[900],
          ),
        ),
      ]),
      body: const Center(
          child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://s1.eestatic.com/2018/11/12/actualidad/actualidad_352727857_105673303_1706x960.jpg'),
        maxRadius: 110,
      )),
    );
  }
}
