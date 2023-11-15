import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: const NetworkImage(
          'https://www.superprof.com.my/blog/wp-content/uploads/2018/02/landscape-photography-tutorials.jpg'),
      fit: BoxFit.cover,
      height: size.height * 0.4,
      width: double.infinity,
    );
  }
}
