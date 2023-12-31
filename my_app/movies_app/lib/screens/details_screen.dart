import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppBar(movie: movie),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _PosterAndTitle(movie: movie),
              _Overview(movie: movie),
              _Overview(movie: movie),
              _Overview(movie: movie),
              CastingCards(movieId: movie.id),
            ],
          ),
        ),
      ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(width: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                  Text(movie.originalTitle,
                      style: textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3),
                  Row(
                    children: [
                      const Icon(Icons.star_outline,
                          size: 15, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(movie.voteAverage.toStringAsFixed(1),
                          style: textTheme.caption),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          movie.overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1,
        ));
  }
}
