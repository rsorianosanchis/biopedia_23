

import '../entities/actor.dart';

abstract class CreditsDatasource {

  Future<List<Actor>> getActorsByMovieId(String movieId);
  
}