import '../entities/movie.dart';
// en esta clase abstracta se define que metodos estan disponibles para implementar .Se define las reglas de llamado a la data
abstract class MoviesDatasource {
  
  Future<List<Movie>> getNowPlaying({int page = 1});

}
