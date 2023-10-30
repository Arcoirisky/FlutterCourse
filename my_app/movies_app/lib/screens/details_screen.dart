import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(slivers: [
        const _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            const [
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards()
            ],
          ),
        ),
      ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'movie.title',
              style: TextStyle(fontSize: 16),
            ),
          ),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('movie.title',
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text('movie.originalTitle',
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('movie.voteAverage', style: textTheme.caption),
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          'Lorem pariatur cupidatat esse consequat veniam sint non. Non laboris fugiat quis ex laborum quis nulla pariatur adipisicing. Occaecat ex labore dolor non do do ullamco ut nulla qui eu commodo. Tempor sit qui aliqua adipisicing. Anim consectetur aute occaecat consequat et magna proident id nisi reprehenderit eiusmod. Sint do aliquip quis enim et nulla nisi.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1,
        ));
  }
}
