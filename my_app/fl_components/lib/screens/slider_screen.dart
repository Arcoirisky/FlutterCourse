import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks Screen'),
      ),
      body: Column(children: [
        Slider.adaptive(
          divisions: 10,
          min: 50,
          max: 800,
          activeColor: AppTheme.primaryColor,
          inactiveColor: AppTheme.primaryColor.withOpacity(0.3),
          thumbColor: AppTheme.primaryColor,
          value: _sliderValue,
          onChanged: _sliderEnabled
              ? (value) {
                  _sliderValue = value;
                  setState(() {});
                }
              : null,
        ),
        Checkbox(
          value: _sliderEnabled,
          onChanged: (value) {
            _sliderEnabled = value ?? true;
            setState(() {});
          },
        ),
        CheckboxListTile(
          activeColor: AppTheme.primaryColor,
          title: const Text('Habilitar slider'),
          value: _sliderEnabled,
          onChanged: (value) => setState(() {
            _sliderEnabled = value ?? true;
          }),
        ),
        Switch(
          value: _sliderEnabled,
          onChanged: (value) => setState(() {
            _sliderEnabled = value;
          }),
        ),
        SwitchListTile.adaptive(
          activeColor: AppTheme.primaryColor,
          title: const Text('Habilitar slider'),
          value: _sliderEnabled,
          onChanged: (value) => setState(() {
            _sliderEnabled = value;
          }),
        ),
        const AboutListTile(),
        Expanded(
          child: SingleChildScrollView(
            child: Image(
              image: const NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpKONMrV07kAaUazSdDsUHDTg5aZzok7p2Yg&usqp=CAU",
              ),
              fit: BoxFit.contain,
              width: _sliderValue,
              height: _sliderValue,
            ),
          ),
        ),
      ]),
    );
  }
}
