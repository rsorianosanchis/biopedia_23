// Aqui el objetivo es crear la instancia del MoviesRepositoryImpl
// para que podamos tener en cualquier otro provider acceso a los datos
// de este repositorio, como por ejemplo las nowplaying
// nota: como esta instancia una vez creada no la vamos a modificar puede ser de solo lectura
// quiero decir, que no cambia la data que esta contenida en la instancia
// usamos flutter_riverpod


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biopedia_23/infrastucture/repositories/movies_repository_impl.dart';
import '../../../infrastucture/datasources/moviedb_movies_datasource_impl.dart';
// Provider del tipo solo lectura, es inmutable
// Es solo proveedor de informacion
final moviesRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(MovieDbMoviesDatasourceImpl());
});
