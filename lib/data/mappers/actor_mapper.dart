import 'package:avilatek_test/data/models/movieDb/creaditsdb_response.dart';
import 'package:avilatek_test/domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        biography: cast.biography,
        name: cast.name,
        profilePath: cast.profilePath != ''
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg',
        character: cast.character,
      );
}
