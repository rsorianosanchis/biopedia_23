import 'package:biopedia_23/infrastucture/datasources/moviedb_datasource_impl.dart';
import 'package:biopedia_23/infrastucture/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final creditsRepositoryProvider = Provider((ref) => 
  MoviesRepositoryImpl(MovieDbDatsourceImpl())
);
