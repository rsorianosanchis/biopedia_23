import 'package:biopedia_23/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final movieDetailsProvider = ref.watch(movieInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie ID: ${widget.movieId}'),
      ),
      body: Center(child: Text('Movie ID: ${movieDetailsProvider[widget.movieId]?.overview}')),
    );
  }
}
