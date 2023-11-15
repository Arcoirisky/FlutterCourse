import 'package:diseno_1/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        physics: const BouncingScrollPhysics(),
        children: const [
          CoverImage(),
          TitleAndValue(),
          ButtonSection(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'Velit minim excepteur ut irure excepteur voluptate est adipisicing ad ex exercitation. Sit amet eiusmod ad magna laborum minim dolore eiusmod aliqua aute non ea sit. Esse ut nisi reprehenderit ullamco Lorem. Consequat adipisicing est ea ex excepteur. Esse culpa proident eu exercitation adipisicing amet aliquip excepteur nisi exercitation in. Ullamco adipisicing reprehenderit sint et esse labore ipsum.',
              softWrap: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
            child: Text(
              'Velit minim excepteur ut irure excepteur voluptate est adipisicing ad ex exercitation. Sit amet eiusmod ad magna laborum minim dolore eiusmod aliqua aute non ea sit. Esse ut nisi reprehenderit ullamco Lorem. Consequat adipisicing est ea ex excepteur. Esse culpa proident eu exercitation adipisicing amet aliquip excepteur nisi exercitation in. Ullamco adipisicing reprehenderit sint et esse labore ipsum.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
