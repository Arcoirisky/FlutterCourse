import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://media.macphun.com/img/uploads/macphun/blog/2063/_1.jpeg?q=75&w=1710&h=906&resize=cover',
            title: 'Un hermoso paisaje.',
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://i.pinimg.com/originals/af/0b/c9/af0bc9e49387570a8e91699c45684db4.jpg',
          ),
          SizedBox(height: 20),
          CustomCardType2(
              imageUrl:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/1400/e6e44355700525.598f62782cc5f.jpg',
              title: 'Mi casa.'),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
