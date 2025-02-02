import 'dart:convert';

import 'package:avilatek_test/config/constants/enviroment.dart';
import 'package:avilatek_test/data/mappers/movie_mapper.dart';
import 'package:avilatek_test/data/models/movieDb/movieDb_response.dart';
import 'package:avilatek_test/data/models/movieDb/movie_details.dart';
import 'package:avilatek_test/domain/datasource/movies_datasource.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDataSourceImpl extends MoviesDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
    },
  ));

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) => MovieMapper.movieDbToEntity(movieDb))
        .toList();
    return movies;
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }
}
