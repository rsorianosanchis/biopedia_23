import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
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
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideShow = ref.watch(
        moviesSlideShowProvider); // usamos este provider que limita el numero de peliculas

    if (nowPlayingMoviesSlideShow.isEmpty) const CircularProgressIndicator();
    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: nowPlayingMoviesSlideShow),
        MoviesHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Now on Cinema',
            subTitle: 'Monday 20th',
            loadNextpage: () {
              
              print('Llamada pelisss');
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();//usamos el read porque estamos dentro de na funcion o callbak
            })
      ],
    );
  }
}
