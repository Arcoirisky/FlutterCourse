import 'package:flutter/material.dart';

class TitleAndValue extends StatelessWidget {
  const TitleAndValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ]),
          ),
          const Icon(Icons.star, color: Colors.red, size: 30),
          const Text('41', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
