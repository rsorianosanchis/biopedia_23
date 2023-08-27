

import '../../domain/entities/actor.dart';
import '../models/mobiedb/cast_movidb.dart';

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
      // :'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', 
      :'https://media.istockphoto.com/id/1131769355/vector/profiles.jpg?s=612x612&w=0&k=20&c=h5DNxihadoqSFnA6TMNuL1BGs6y11mj29kYYx4_tYZk=', 
      castId: castMovieDb.castId,
      character: castMovieDb.character,
      creditId: castMovieDb.creditId,
      order: castMovieDb.order
    );
}
