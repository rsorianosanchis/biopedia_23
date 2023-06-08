import '../entities/movie.dart';

// gracias ala repositiorio llamamos de forma indirecta a la dta. 
abstract class MoviesRepository {
  
  Future<List<Movie>> getNowPlaying({int page = 1});

}
