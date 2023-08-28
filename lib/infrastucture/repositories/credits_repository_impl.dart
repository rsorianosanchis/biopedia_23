import 'package:biopedia_23/domain/entities/actor.dart';
import 'package:biopedia_23/domain/repositories/credits_repository.dart';
import '../../domain/datasources/credits_datasource.dart';

class CreditsRepositoryImpl extends CreditsRepository{

  final CreditsDatasource datasource; // llamaos al CreditsDatasourceem general y no al Implemt para que sea henerico y quepa como propiedad cuaklquier clase extendida de creditdatasource. Asi puede venir de miultiåples APIS

  CreditsRepositoryImpl(this.datasource); // ha

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return datasource.getActorsByMovieId(movieId);
  }


}