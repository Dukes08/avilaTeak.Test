import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/presentation/providers/actors/actors_by_movie_provider.dart';
import 'package:avilatek_test/presentation/providers/movies/movie_detail_provider.dart';
import 'package:avilatek_test/presentation/widgets/movies/movie_detail_popup.dart';
import 'package:avilatek_test/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import '../../domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  bool _isPopupVisible = false;

  @override
  void initState() {
    super.initState();
    ref.read(movieDetailProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  void _togglePopup() {
    setState(() {
      _isPopupVisible = !_isPopupVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailProvider)[widget.movieId];
    final List<Actor>? actorsByMovie =
        ref.watch(actorsByMovieProvider)[widget.movieId];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        icon: 'assets/images/x_icon.png',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              _togglePopup();
            },
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.4, 1.0],
                      colors: [Colors.transparent, Colors.black],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          if (_isPopupVisible)
            GestureDetector(
              onTap: _togglePopup,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SlideInUp(
                  delay: const Duration(milliseconds: 100),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: MovieDetailPopup(
                      actors: actorsByMovie!,
                      title: movie.title,
                      userScore: movie.voteAverage,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
