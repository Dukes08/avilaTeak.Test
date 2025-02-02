import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/domain/entities/movie.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(String movieId);
  Future<Actor> getActorProfile(String actorId);
  Future<List<Movie>> getMoviesByActors(String actorId);
}
