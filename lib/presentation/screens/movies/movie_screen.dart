
import 'package:biopedia_23/presentation/widgets/movies/actors_horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actor.dart';
import '../../../domain/entities/movie.dart';
import '../../providers/providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieIdProvider.notifier).loadActors(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    // final movieDetailsProvider = ref.watch(movieInfoProvider);
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    final Map<String, List<Actor>> actors = ref.watch(actorsByMovieIdProvider);

    if (movie == null)return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => _MovieDetails(
                      movie: movie,
                      actors: actors['${movie.id}'],
                    )),
          ),
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final List<Actor> ? actors;
  final Movie movie;
  const _MovieDetails({required this.movie, required this.actors});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: screenSize.width * 0.3,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyles.titleLarge),
                Text('db_ID: ${movie.id}', style: textStyles.titleLarge),
                Text(movie.overview),
              ],
            ))
          ]),
        ),
        // genre movies
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genres!.map((e) => Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Chip(
                      label: Text(e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ))
            ],
          ),
        ),

        //todo: show actors listview
        ActorsHorizontalListview(actors: actors),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomSliverAppBar({required this.movie});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      iconTheme: IconThemeData(color: colors.background),
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          title: Text(
            movie.title,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
          ),
          background: Stack(children: [
            SizedBox.expand(
                child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            )),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1],
                          colors: [Colors.transparent, Colors.black87]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                    0.0,
                    0.2
                  ],
                          colors: [
                    Colors.black87,
                    Colors.transparent,
                  ]))),
            )
          ])),
    );
  }
}
