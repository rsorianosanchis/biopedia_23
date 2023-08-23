import 'package:biopedia_23/infrastucture/models/cast_movidb.dart';

import '../../domain/entities/actor.dart';

class ActorMapper {
  static Actor moviedDbToActorEntity(CastMovieDb castMovieDb) => Actor(
      adult: castMovieDb.adult,
      gender: castMovieDb.gender,
      id: castMovieDb.id,
      knownForDepartment: castMovieDb.knownForDepartment,
      name: castMovieDb.name,
      originalName: castMovieDb.originalName,
      popularity: castMovieDb.popularity,
      profilePath: castMovieDb.profilePath != null
      ?'https://image.tmdb.org/t/p/w500/${castMovieDb.profilePath}'
      :'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', 
      castId: castMovieDb.castId,
      character: castMovieDb.character,
      creditId: castMovieDb.creditId,
      order: castMovieDb.order
    );
}
