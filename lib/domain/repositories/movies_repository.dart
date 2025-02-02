import 'package:avilatek_test/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopular({int page = 1});
  Future<Movie> getMovieById(String id);
}
