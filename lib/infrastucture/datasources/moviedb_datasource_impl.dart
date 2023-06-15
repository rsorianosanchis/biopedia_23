import 'package:biopedia/config/constants/enviroment.dart';
import 'package:biopedia/domain/datasources/movies_datasource.dart';
import 'package:biopedia/domain/entities/movie.dart';
import 'package:biopedia/infrastucture/mappers/movie_mapper.dart';
import 'package:biopedia/infrastucture/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

// Esta es la implementacion en exclusiva de datasource para moviedb
// si queremos impelmnetacion de otra fuente hay que generar otro archivo como esta para la nueva fuernt
class MovieDbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': 'es-ES'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
        '/movie/now_playing'); // en el argumento path solova la parte exclusiva o diferente

    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
      .where((element) => element.posterPath != '')//aqui con el where filtra que no sea vacio para que sea true y siga el map
      .map((e) => MovieMapper.movieDbToEntity(e)).toList();
    return movies;
  }
}
