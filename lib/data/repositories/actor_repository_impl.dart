import 'package:avilatek_test/domain/datasource/actors_datasource.dart';
import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:avilatek_test/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

  @override
  Future<Actor> getActorProfile(String actorId) {
    return datasource.getActorProfile(actorId);
  }

  @override
  Future<List<Movie>> getMoviesByActors(String actorId) {
    return datasource.getMoviesByActors(actorId);
  }
}
