import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonHelper extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  const ButtonHelper({
    super.key,
    this.icon = FontAwesomeIcons.plus,
    this.text = 'Haz solicitado',
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
  });

  @override
  Widget build(BuildContext context) {
    return _BackgroundButton(
        icon: icon,
        color1: color1,
        color2: color2,
        child: _BodyButton(
          icon: icon,
          text: text,
        ));
  }
}

class _BodyButton extends StatelessWidget {
  const _BodyButton({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _BackgroundButton extends StatelessWidget {
  const _BackgroundButton({
    required this.child,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  final Widget child;
  final IconData icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: getDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  BoxDecoration getDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          spreadRadius: 2,
          offset: Offset(4, 10),
        ),
      ],
      gradient: LinearGradient(
        colors: [
          color1,
          color2,
        ],
      ),
    );
  }
}
