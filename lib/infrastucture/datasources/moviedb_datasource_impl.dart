import 'package:biopedia_23/config/constants/environment.dart';
import 'package:biopedia_23/domain/datasources/movies_datasource.dart';
import 'package:biopedia_23/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MovieDbDatsourceImpl extends MoviesDatasource {

  final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3', 
        queryParameters: {
          'api_key': Environment.theMovieDbKey,
          'language': 'us-US',
        }
      )
  );

  @override

  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];



    return movies;
  }

}
