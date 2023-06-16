import 'package:biopedia/domain/entities/movie.dart';
import 'package:biopedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// este es un provider para consultar que peliculas estan ahora en produccion
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMovies);

});
//
typedef MovieCallback = Future<List<Movie>> Function({int page});
//
class MoviesNotifier extends StateNotifier<List<Movie>> {
  // esta clase tiene como mision proporcionar el List<Movie>

  int currentPage = 0;

  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    //cada vez que lo llame cargare nuevas peliculas cambiando la pagina a la llamada
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    //el  bojetivo de est emetodo es provocar un state, en este caso un nuevo state en el List<Movie>
    state = [...state, ...movies];
  }
}
