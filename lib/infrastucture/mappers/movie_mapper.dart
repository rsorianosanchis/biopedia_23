// Aqui vamos a leer el modelo movie de la API y los vamos a convertir a nuestro modelo de negocio entity Movie
import 'package:biopedia_23/infrastucture/models/moviedb_movie_details_response.dart';

import '../../domain/entities/movie.dart';
import '../models/movie_moviedb.dart';

class MovieMapper {


  // MApeo del modelo de la api MovieDB
  static Movie movieDbToEntity (MovieMovieDb movieMovieDb) => Movie(
    adult: movieMovieDb.adult, 
    backdropPath: movieMovieDb.backdropPath != ''
      ?'https://image.tmdb.org/t/p/w500/${movieMovieDb.backdropPath}'
      :'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', 
    genreIds: movieMovieDb.genreIds.map((e) => e.toString()).toList(), 
    id: movieMovieDb.id, 
    originalLanguage: movieMovieDb.originalLanguage, 
    originalTitle: movieMovieDb.originalTitle, 
    overview: movieMovieDb.overview, 
    popularity: movieMovieDb.popularity, 
    posterPath: movieMovieDb.posterPath != ''
      ?'https://image.tmdb.org/t/p/w500/${movieMovieDb.posterPath}'
      :'no-poster', 
    releaseDate: movieMovieDb.releaseDate, 
    title: movieMovieDb.title, 
    video: movieMovieDb.video, 
    voteAverage: movieMovieDb.voteAverage, 
    voteCount: movieMovieDb.voteCount
  );

  static Movie movieDbMovieDetailsToEntity ( MovieDbMovieDetailsResponse movieDbMovieDetailsResponse ) => Movie(
    adult: movieDbMovieDetailsResponse.adult, 
    backdropPath: movieDbMovieDetailsResponse.backdropPath != ''
      ?'https://image.tmdb.org/t/p/w500/${movieDbMovieDetailsResponse.backdropPath}'
      :'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', 
    genreIds: movieDbMovieDetailsResponse.genres.map((e) => e.toString()).toList(), 
    id: movieDbMovieDetailsResponse.id, 
    originalLanguage: movieDbMovieDetailsResponse.originalLanguage, 
    originalTitle: movieDbMovieDetailsResponse.originalTitle, 
    overview: movieDbMovieDetailsResponse.overview, 
    popularity: movieDbMovieDetailsResponse.popularity, 
    posterPath: movieDbMovieDetailsResponse.posterPath != ''
      ?'https://image.tmdb.org/t/p/w500/${movieDbMovieDetailsResponse.posterPath}'
      :'no-poster', 
    releaseDate: movieDbMovieDetailsResponse.releaseDate, 
    title: movieDbMovieDetailsResponse.title, 
    video: movieDbMovieDetailsResponse.video, 
    voteAverage: movieDbMovieDetailsResponse.voteAverage, 
    voteCount: movieDbMovieDetailsResponse.voteCount
  );





}