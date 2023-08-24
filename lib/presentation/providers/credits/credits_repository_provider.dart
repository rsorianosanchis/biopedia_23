
import 'package:biopedia_23/infrastucture/datasources/moviedb_credits_datasource_impl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastucture/repositories/credits_repository_impl.dart';

final creditsRepositoryProvider = Provider((ref) => 
  CreditsRepositoryImpl(MovieDdCreditsDatasourceImpl())
);
