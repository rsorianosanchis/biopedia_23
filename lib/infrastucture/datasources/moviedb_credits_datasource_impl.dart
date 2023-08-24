import 'package:biopedia_23/config/constants/environment.dart';
import 'package:biopedia_23/domain/entities/actor.dart';
import 'package:biopedia_23/infrastucture/mappers/actor_mapper.dart';
import 'package:biopedia_23/infrastucture/models/moviedb_credits_response.dart';
import 'package:dio/dio.dart';
import '../../domain/datasources/credits_datasource.dart';


class MovieDdCreditsDatasourceImpl extends CreditsDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.theMovieDbKey,
    'language': 'us-US',
  }));

  

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
