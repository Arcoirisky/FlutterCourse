import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? title;

  const CustomCardType2({Key? key, required this.imageUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 30,
        shadowColor: AppTheme.primaryColor.withOpacity(0.5),
        child: Column(
          children: [
            FadeInImage(
              fadeInDuration: const Duration(milliseconds: 300),
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ),
            if (title != null)
              Container(
                child: Text(title!),
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                alignment: AlignmentDirectional.centerEnd,
              )
          ],
        ));
  }
}
