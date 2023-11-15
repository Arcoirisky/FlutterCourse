import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.border_all,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.purpleAccent,
            icon: Icons.car_rental,
            text: 'Transport',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.shop,
            text: 'Shopping',
          ),
          _SingleCard(
            color: Colors.orange,
            icon: Icons.cloud,
            text: 'Bills',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.blueAccent,
            icon: Icons.movie,
            text: 'Entertainment',
          ),
          _SingleCard(
            color: Colors.green,
            icon: Icons.food_bank,
            text: 'Grocery',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.red,
            icon: Icons.collections,
            text: 'Photos',
          ),
          _SingleCard(
            color: Colors.teal,
            icon: Icons.help,
            text: 'Help',
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      gradient: RadialGradient(
        radius: .9,
        colors: [
          color,
          Colors.white,
        ],
        stops: const [0.3, 0.9],
      ),
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          blurRadius: 3,
          color: Colors.white.withOpacity(0.2),
        )
      ],
    );

    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: boxDecoration,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
              radius: 30,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
