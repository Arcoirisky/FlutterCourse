import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();

  void _addImages() {
    final lastId = imagesIds.last;
    for (var i = lastId; i < lastId + 10; i++) {
      imagesIds.add(i + 1);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        _addImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=${imagesIds[index]}'),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              );
            }),
      ),
    );
  }
}
