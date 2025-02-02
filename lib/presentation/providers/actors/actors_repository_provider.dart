// Este repositorio es inmutable
import 'package:avilatek_test/data/datasource/actor_datasource_impl.dart';
import 'package:avilatek_test/data/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
