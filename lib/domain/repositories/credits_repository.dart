import '../entities/actor.dart';

abstract class CreditsRepository {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}