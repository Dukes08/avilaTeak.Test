import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:avilatek_test/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesByActorProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Movie>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(
      getMoviesByActor: actorsRepository.getMoviesByActors);
});

typedef GetActorsCallback = Future<List<Movie>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Movie>>> {
  final GetActorsCallback getMoviesByActor;

  ActorsByMovieNotifier({
    required this.getMoviesByActor,
  }) : super({});

  Future<void> loadMovies(String actorId) async {
    if (state[actorId] != null) return;

    final List<Movie> movies = await getMoviesByActor(actorId);
    state = {...state, actorId: movies};
  }
}
