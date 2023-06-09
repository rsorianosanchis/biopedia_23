import 'package:biopedia/infrastucture/datasources/moviedb_datasource_impl.dart';
import 'package:biopedia/infrastucture/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// este repositorio es inmutable, es un proveedor de datos solo lectura que puede proveer a todos los demas providers todas las implementaciones internas. Como por ejemplo los datos que arroja getnowplaying.
// AQUI ES DONDE CREAMOS REALMENTE LA INSTANCIS DEL MovieRepositoryImpl() y este alimentará a cualquier otro provider que lo necesite porque esta dentro del provider
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDatasourceImpl());
});
