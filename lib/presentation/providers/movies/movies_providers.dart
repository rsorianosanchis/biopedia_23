import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biopedia_23/presentation/providers/movies/movies_repository_provider.dart';
import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref
      .watch(moviesRepositoryProvider)
      .getNowPlaying; // llamamos a este provider para poder pasar el argumento
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upComingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref
      .watch(moviesRepositoryProvider)
      .getUpcoming; // llamamos a este provider para poder pasar el argumento
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref
      .watch(moviesRepositoryProvider)
      .getPopular; // llamamos a este provider para poder pasar el argumento
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref
      .watch(moviesRepositoryProvider)
      .getTopRated; // llamamos a este provider para poder pasar el argumento
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});
//
//
//
//
// aqui me invento un tipo de variable, en este caso es una funcion future que debe devolber lista de Mocie.
typedef MovieCallback = Future<List<Movie>> Function({int page});
//
//
//
class MoviesNotifier extends StateNotifier<List<Movie>> {
  // el StateNotifier es una clase que sirve para manejar el estado(en este caso List<Movie>)
  int currentPage = 0; //para saber la pagina actual
  //aqui anado una propiedad tipo MovieCallback
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  // metodo con objetivo de modificar el state(que recordemos que es state es un listado de Movie List<Movie>)
  Future<void> loadNextPage() async {
    if (isLoading == true) return;
    isLoading = true;
    print('******LOADING MORE MOVIES***********');
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    Future.delayed(const Duration(milliseconds: 2000));
    isLoading = false;
  }
}
