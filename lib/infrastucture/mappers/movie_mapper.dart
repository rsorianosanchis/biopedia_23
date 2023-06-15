import 'package:biopedia/domain/entities/movie.dart';
import 'package:biopedia/infrastucture/models/moviedb/movie_moviedb.dart';
//Aqui es donde cargamos la data del response de la Api a nuestra entity
// Aqui hariamods las modificaiones para integrar otras apis a nuestra entity manipulando la carga de los valores
// El Maper es una clase donde tenemos un metodo que nos devuelve una onstancia de nuestra entity y cargamos los datos que vienen de la api
class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ''
        ?'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        :'https://ih1.redbubble.net/image.3256224674.8746/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ''
        ?'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        :'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
