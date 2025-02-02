import 'package:avilatek_test/data/datasource/moviedb_datasource_impl.dart';
import 'package:avilatek_test/data/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider(
  (ref) => MovieRepositoryImpl(
    datasource: MoviedbDataSourceImpl(),
  ),
);
