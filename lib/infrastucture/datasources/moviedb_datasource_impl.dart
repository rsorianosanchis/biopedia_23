import 'package:biopedia_23/config/constants/environment.dart';
import 'package:biopedia_23/domain/datasources/movies_datasource.dart';
import 'package:biopedia_23/domain/entities/actor.dart';
import 'package:biopedia_23/domain/entities/movie.dart';
import 'package:biopedia_23/infrastucture/mappers/actor_mapper.dart';
import 'package:biopedia_23/infrastucture/models/moviedb_credits_response.dart';
import 'package:biopedia_23/infrastucture/models/moviedb_movie_details_response.dart';
import 'package:biopedia_23/infrastucture/models/moviedb_response.dart';
import 'package:dio/dio.dart';

import '../mappers/movie_mapper.dart';

class MovieDbDatsourceImpl extends MoviesDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.theMovieDbKey,
    'language': 'us-US',
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != '')
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    //todo : refacotrizar todo el codigo que se repite en los métodos creando una funcion externa local común
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != '')
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != '')
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != '')
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();

    return movies;
  }

  @override
  Future<Movie> getMovieDetailsById(String movieId) async {
    final response = await dio.get('/movie/$movieId');

    if (response.statusCode != 200)
      throw Exception('Movie with id: $movieId not found');

    final movieDbResponse = MovieDbMovieDetailsResponse.fromJson(response.data);

    final Movie movie =
        MovieMapper.movieDbMovieDetailsToEntity(movieDbResponse);

    return movie;
  }

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final movieDbresponse = MovieDbCreditsResponse.fromJson(response.data);

    final List<Actor> actors = movieDbresponse.cast
        .map((e) => ActorMapper.moviedDbToActorEntity(e))
        .toList();
    return actors;
  }
}
