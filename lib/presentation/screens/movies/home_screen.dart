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
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoviesSlideShow = ref.watch(moviesSlideShowProvider); // usamos este provider que limita el numero de peliculas
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    if (nowPlayingMoviesSlideShow.isEmpty) const CircularProgressIndicator();
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace:FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
        
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              // const CustomAppbar(),
              MoviesSlideshow(movies: nowPlayingMoviesSlideShow),
              MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Now on Cinema',
                  subTitle: 'Monday 20th',
                  loadNextpage: () {
                    
                    ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(); //usamos el read porque estamos dentro de na funcion o callbak
                  }),

              (upComingMovies.isNotEmpty)?MoviesHorizontalListview(
                  movies: upComingMovies,
                  title: 'Soon',
                  subTitle: 'This month',
                  loadNextpage: () {
                    
                    ref
                        .read(upComingMoviesProvider.notifier)
                        .loadNextPage(); //usamos el read porque estamos dentro de na funcion o callbak
                  }):const CircularProgressIndicator(),

              MoviesHorizontalListview(
                  movies: popularMovies,
                  title: 'Popular',
                  //subTitle: 'This month',
                  loadNextpage: () {
                    
                    ref
                        .read(popularMoviesProvider.notifier)
                        .loadNextPage(); //usamos el read porque estamos dentro de na funcion o callbak
                  }),

              MoviesHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Best ever',
                  subTitle: 'Best qualifications',
                  loadNextpage: () {
                  
                    ref
                        .read(topRatedMoviesProvider.notifier)
                        .loadNextPage(); //usamos el read porque estamos dentro de na funcion o callbak
              }
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
