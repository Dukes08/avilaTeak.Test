import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:avilatek_test/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMorePopularMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMorePopularMovies: fetchMorePopularMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  MovieCallback fetchMorePopularMovies;

  MoviesNotifier({
    required this.fetchMorePopularMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMorePopularMovies(page: currentPage);
    state = [...state, ...movies];
    isLoading = false;
  }
}
