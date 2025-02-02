import 'package:avilatek_test/config/constants/enviroment.dart';
import 'package:avilatek_test/data/mappers/actor_mapper.dart';
import 'package:avilatek_test/data/mappers/movie_mapper.dart';
import 'package:avilatek_test/data/models/movieDb/creaditsdb_response.dart'
    as credits;
import 'package:avilatek_test/data/models/movieDb/movie_from_moviedb.dart';
import 'package:avilatek_test/data/models/movieDb/movies_by_actor.dart'
    as movies_by_actor_model;
import 'package:avilatek_test/domain/datasource/actors_datasource.dart';
import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {'api_key': Environment.movieDbKey, 'language': 'es-MX'},
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final castResponse = credits.CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }

  @override
  Future<Actor> getActorProfile(String actorId) async {
    final response = await dio.get('/person/$actorId');
    final actorProfileResponse = credits.Cast.fromJson(response.data);

    Actor actor = ActorMapper.castToEntity(actorProfileResponse);
    return actor;
  }

  @override
  Future<List<Movie>> getMoviesByActors(String actorId) async {
    final response = await dio.get('/person/$actorId/combined_credits');
    final moviesByActorResponse =
        movies_by_actor_model.MoviesFromActor.fromJson(response.data);
    final List<Movie> movies = moviesByActorResponse.cast
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map(
          (movieDb) => MovieMapper.movieByActorToEntity(movieDb),
        )
        .toList();

    return movies;
  }
}
