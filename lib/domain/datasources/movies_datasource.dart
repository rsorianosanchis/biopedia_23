import '../entities/movie.dart';

abstract class MoviesDatasource {
  List<Movie> getNowPlaying({int page = 1});
}
