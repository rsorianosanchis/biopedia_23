import 'package:biopedia_23/domain/datasources/movies_datasource.dart';
import 'package:biopedia_23/domain/entities/movie.dart';
import 'package:biopedia_23/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRespository {
  
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);// hacemos argumento o propiedad posicional

  @override
  Future <List<Movie>> getNowPlaying({int page = 1}) async{
    return datasource.getNowPlaying(page: page);
  }
}
