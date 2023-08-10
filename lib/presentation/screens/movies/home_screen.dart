
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  //dentro del consumer state tengo acceso al ref
  //nota: acordarse que dentro de los metodos usamos el ref.read
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMovies = ref.watch(moviesSlideShowProvider); // usamos este provider que limita el numero de peliculas

    if (nowPlayingMovies.isEmpty) const CircularProgressIndicator();
    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: nowPlayingMovies)
      ],
    );
  }
}
