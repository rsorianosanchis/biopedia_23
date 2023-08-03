import '../entities/movie.dart';

abstract class MoviesRespository {
  List<Movie> getNowPlaying({int page = 1});
}
