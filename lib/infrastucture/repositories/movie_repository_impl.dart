import 'package:biopedia/domain/datasources/movies_datasource.dart';
import 'package:biopedia/domain/entities/movie.dart';
import 'package:biopedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  // con esta propiedad MoviesDatasource puedo cargar cualquier implementacion de datasource que extiende de ella.
  // así llamando esta clase de implemntacion en la que estamos podemos cargar cualquier datasource que asu vez comparten los mismos nombres de  metodos 
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page );
  }
}
