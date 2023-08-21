import 'package:go_router/go_router.dart';
import 'package:biopedia_23/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/', 
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [ //Esta routes dentro de esta significa que cuando vayan a una de ellas si hacen deshacer o atras volveran a la ruta padre es decir a la contenedora
        GoRoute(
          // path: '/movie/:id',
          path: 'movie/:id', //quitamos la primera / porque ya la da el padre
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        )
      ]
    ),
    
  ]
);
