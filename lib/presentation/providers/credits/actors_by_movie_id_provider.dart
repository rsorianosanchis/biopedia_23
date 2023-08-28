import 'package:biopedia_23/presentation/providers/credits/credits_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actor.dart';

final actorsByMovieIdProvider = StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {
  final actorsByMovieID = ref
      .watch(creditsRepositoryProvider);
       // llamamos a este provider para poder pasar el argumento
  return ActorsNotifier(getActotsByMovieId: actorsByMovieID.getActorsByMovieId);
});
//
//
//
//
// aqui me invento un tipo de variable, en este caso es una funcion future que debe devolber lista de Mocie.
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

//
//
//
class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {
  bool isLoading = false;
  GetActorsCallback getActotsByMovieId;

  ActorsNotifier({required this.getActotsByMovieId}) : super({});

  // metodo con objetivo de modificar el state(que recordemos que es state es un listado de Movie List<Movie>)
  Future<void> loadActors({required String movieId}) async {
    if (state[movieId] != null) return; // cuando el state se tarta de un mapa la llave parece que funciona sin comillas
    if (isLoading == true) return;
    isLoading = true;
    print('******http for LOADING Actors***********');

    final List<Actor> actors = await getActotsByMovieId(movieId);
    state = {...state, movieId: actors};
    Future.delayed(const Duration(milliseconds: 2000));
    isLoading = false;
  }
}
