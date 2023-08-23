import 'dart:ffi';

import 'package:biopedia_23/presentation/providers/credits/credits_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actor.dart';

final movieActorsCreditsProvider =
    StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {
  final getActorsByMovieID = ref
      .watch(creditsRepositoryProvider)
      .getActorsByMovieId; // llamamos a este provider para poder pasar el argumento
  return ActorsNotifier(getCreditsByMovieId: getActorsByMovieID);
});
//
//
//
//
// aqui me invento un tipo de variable, en este caso es una funcion future que debe devolber lista de Mocie.
typedef CreditsCallback = Future<List<Actor>> Function(String movieId);

//
//
//
class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {
  bool isLoading = false;
  CreditsCallback getCreditsByMovieId;

  ActorsNotifier({required this.getCreditsByMovieId}) : super({});

  // metodo con objetivo de modificar el state(que recordemos que es state es un listado de Movie List<Movie>)
  Future<void> loadActors({required String movieId}) async {
    if (state['movieId'] != null) return;
    if (isLoading == true) return;
    isLoading = true;
    print('******http for LOADING Actors***********');

    final List<Actor> actors = await getCreditsByMovieId(movieId);
    state = {...state, movieId: actors};
    Future.delayed(const Duration(milliseconds: 2000));
    isLoading = false;
  }
}
