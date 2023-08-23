import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref
      .watch(moviesRepositoryProvider)
      .getMovieDetailsById; //TODO: INVESTIGAR QUE ME HE DADFO CUENTA QUE PARA CARGAR FUNCIONES SIN EJECUTARLAS(ES DECIR SIN PARENRESIS) NO PUEDES SER FUNCIONES CON VARIABLES  POR NOMBRE

  return MovieMapNotifier(getMovie: movieRepository);
});

/*
  {
    '50642':Movie(),
    '50643':Movie(),
    '50644':Movie(),
    '50655':Movie(),

  }

*/
typedef GetMovieCallBack = Future<Movie> Function(String id);//todo: tambien aqui tiene que ser posicional
//
//

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print('doing http request');

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};

  }
}
