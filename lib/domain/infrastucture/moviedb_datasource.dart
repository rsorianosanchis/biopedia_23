import 'package:biopedia/domain/datasources/movies_datasource.dart';
import 'package:biopedia/domain/entities/movie.dart';
// Esta es la implementacion en exclusiva de datasource para moviedb
// si queremos impelmnetacion de otra fuente hay que generar otro archivo como esta para la nueva fuernt
class MovieDbDatasource extends MoviesDatasource {

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    
    return [];
  }



}