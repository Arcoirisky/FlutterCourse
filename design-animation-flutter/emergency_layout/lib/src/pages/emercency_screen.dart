import 'package:animate_do/animate_do.dart';
import 'package:emergency_layout/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          ButtonList(),
          PageHeader(),
        ],
      ),
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

final items = <ItemBoton>[
  ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
      const Color(0xff6989F5), const Color(0xff906EF5)),
  ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2),
      const Color(0xff536CF6)),
  ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
      const Color(0xffF2D572), const Color(0xffE06AA3)),
  ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183),
      const Color(0xff46997D)),
  ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
      const Color(0xff6989F5), const Color(0xff906EF5)),
  ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2),
      const Color(0xff536CF6)),
  ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
      const Color(0xffF2D572), const Color(0xffE06AA3)),
  ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183),
      const Color(0xff46997D)),
  ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
      const Color(0xff6989F5), const Color(0xff906EF5)),
  ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2),
      const Color(0xff536CF6)),
  ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
      const Color(0xffF2D572), const Color(0xffE06AA3)),
  ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183),
      const Color(0xff46997D)),
];

class ButtonList extends StatelessWidget {
  const ButtonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 250),
      child: Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: items
              .map((item) => FadeInLeft(
                    duration: const Duration(milliseconds: 250),
                    child: ButtonHelper(
                      icon: item.icon,
                      text: item.texto,
                      color1: item.color1,
                      color2: item.color2,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Haz solicitado',
      title: 'Asistencia Médica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
