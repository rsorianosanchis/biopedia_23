import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../providers.dart';

// aqui usamos un provider para procesar los datos que vienen de otro provider y alterar el renderizado. En est caso solo queremos usar 6 peliculas del nowplaying
final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  // podemos dentro de un provider aceder a otro. En este caso recibimos tambien aqui en paralelo el estado de las nowplayingmovies, al igual que en el el homescreen
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0, 6);
});
