import 'package:avilatek_test/domain/datasource/movies_datasource.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:avilatek_test/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource datasource;
  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
}
