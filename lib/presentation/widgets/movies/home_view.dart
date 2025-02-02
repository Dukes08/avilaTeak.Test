import 'package:avilatek_test/presentation/providers/movies/movies_providers.dart';
import 'package:avilatek_test/presentation/widgets/movies/movies_vertical_listview.dart';
import 'package:avilatek_test/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_loadNextPage);
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  void _loadNextPage() {
    if (_scrollController.position.pixels + 200 >=
        _scrollController.position.maxScrollExtent) {
      ref.read(popularMoviesProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(popularMoviesProvider);

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(
              title: 'Latest',
            ),
          ),
        ),
        MoviesVerticalListview(
          movies: popularMovies,
          scrollController: _scrollController,
          loadNextPage: () {
            ref.read(popularMoviesProvider.notifier).loadNextPage();
          },
        ),
      ],
    );
  }
}
