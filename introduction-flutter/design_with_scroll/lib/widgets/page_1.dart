import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // Background image
        _Background(),
        _MainContent()
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 50,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return SafeArea(
      bottom: false,
      child: Center(
        child: Column(
          children: const [
            SizedBox(height: 32),
            Text('11°', style: textStyle),
            Text('Miércoles', style: textStyle),
            Expanded(
              child: SizedBox(),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 150,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(
        image: AssetImage('assets/scroll-1.png'),
      ),
    );
  }
}
