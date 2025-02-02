import 'package:avilatek_test/data/models/movieDb/movie_details.dart';
import 'package:avilatek_test/data/models/movieDb/movie_from_moviedb.dart';
import 'package:avilatek_test/data/models/movieDb/movies_by_actor.dart';
import 'package:avilatek_test/domain/entities/movie.dart';

// recivimos la pelicula con el formato de la  api y la transformamos a la entidad que nuestra app maneja
//esto ayuda a que si lo que retorna la api cambia solo tenemos que cambiarlo aca y no en toda la app, ya que la entity se mantiene igual solo que accede a valores distintos del objeto que viene de la api
class MovieMapper {
  static Movie movieDbToEntity(MovieFromMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : '',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          // este no-poster a la hora de adquierer los datos va a permitir filtrar con el where las peliculas que no tenga poster
          : 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
      adult: movie.adult,
      backdropPath: (movie.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
          : '',
      genreIds: movie.genres.map((e) => e.name).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: (movie.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
          // este no-poster a la hora de adquierer los datos va a permitir filtrar con el where las peliculas que no tenga poster
          : 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);

  static Movie movieByActorToEntity(Cast movie) => Movie(
      adult: movie.adult,
      backdropPath: (movie.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
          : 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
      genreIds: movie.genreIds.map((e) => '$e').toList(),
      id: movie.id,
      originalLanguage: '',
      originalTitle: '',
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: (movie.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
          // este no-poster a la hora de adquierer los datos va a permitir filtrar con el where las peliculas que no tenga poster
          : 'no-poster',
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
