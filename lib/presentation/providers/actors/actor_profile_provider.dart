import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByIdProvider =
    StateNotifierProvider<ActorsById, Map<String, Actor>>((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsById(getActorById: actorsRepository.getActorProfile);
});

typedef GetActorsCallback = Future<Actor> Function(String actorId);

class ActorsById extends StateNotifier<Map<String, Actor>> {
  final GetActorsCallback getActorById;

  ActorsById({
    required this.getActorById,
  }) : super({});

  Future<void> loadActor(String actorId) async {
    if (state[actorId] != null) return;

    final Actor actor = await getActorById(actorId);
    state = {...state, actorId: actor};
  }
}
