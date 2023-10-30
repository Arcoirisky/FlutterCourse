import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Slider.adaptive(
            divisions: 10,
            min: 50,
            max: 400,
            value: _sliderValue,
            onChanged: (value) {
              _sliderValue = value;
              setState(() {});
            },
          ),
          Image(
            image: const NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpKONMrV07kAaUazSdDsUHDTg5aZzok7p2Yg&usqp=CAU",
            ),
            fit: BoxFit.contain,
            width: _sliderValue,
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
