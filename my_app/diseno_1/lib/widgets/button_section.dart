import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _CustomButton(icon: Icons.phone, text: 'CALL', color: Colors.blue),
        _CustomButton(icon: Icons.near_me, text: 'ROUTE', color: Colors.blue),
        _CustomButton(icon: Icons.share, text: 'SHARE', color: Colors.blue),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _CustomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: color, size: 30)),
        Text(text, style: TextStyle(fontSize: 16, color: color)),
      ],
    );
  }
}
