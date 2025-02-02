import 'package:avilatek_test/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getPopular({int page = 1});
  Future<Movie> getMovieById(String id);
}
