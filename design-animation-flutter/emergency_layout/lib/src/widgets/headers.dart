import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return _BackgroundHeader(
      color1: color1,
      color2: color2,
      icon: icon,
      child: SafeArea(
        bottom: false,
        child: Stack(alignment: Alignment.center, children: [
          const SizedBox(width: double.infinity),
          const _SeeMore(),
          _BodyHeader(
            title: title,
            subtitle: subtitle,
            icon: icon,
          ),
        ]),
      ),
    );
  }
}

class _SeeMore extends StatelessWidget {
  const _SeeMore();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: RawMaterialButton(
        onPressed: () {},
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15.0),
        child: const FaIcon(
          FontAwesomeIcons.ellipsisVertical,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class _BackgroundHeader extends StatelessWidget {
  final Widget child;
  final Color color1;
  final Color color2;
  final IconData icon;

  const _BackgroundHeader({
    required this.child,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getDecoration(),
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              icon,
              color: Colors.white.withOpacity(0.2),
              size: 250,
            ),
          ),
          child
        ],
      ),
    );
  }

  BoxDecoration getDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(80),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color1,
          color2,
        ],
      ),
    );
  }
}

class _BodyHeader extends StatelessWidget {
  const _BodyHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var withOpacity = Colors.white.withOpacity(0.7);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subtitle,
          style: TextStyle(
            color: withOpacity,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: withOpacity,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 20),
        FaIcon(
          icon,
          color: Colors.white,
          size: 80,
        ),
      ],
    );
  }
}
