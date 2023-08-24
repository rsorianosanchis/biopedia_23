import 'package:biopedia_23/domain/entities/actor.dart';
import 'package:biopedia_23/domain/repositories/credits_repository.dart';
import '../../domain/datasources/credits_datasource.dart';

class CreditsRepositoryImpl extends CreditsRepository{

  final CreditsDatasource datasource;

  CreditsRepositoryImpl(this.datasource); // ha

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return datasource.getActorsByMovieId(movieId);
  }


}