import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final newsService = Provider.of<NewsService>(context).headlines;
    // newsService.headlines;

    return Scaffold(
      // body: ListaNoticias(noticias: newsService),
      body: (newsService.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : ListaNoticias(noticias: newsService),
    );
  }
}
