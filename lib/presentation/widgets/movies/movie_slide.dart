import 'package:animate_do/animate_do.dart';
import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieSlide extends StatelessWidget {
  final Movie? movie;
  final Actor? actor;

  const MovieSlide({super.key, this.movie, this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => movie != null
            ? context.push('/movie/${movie!.id}')
            : context.push('/actor/${actor!.id}'),
        child: Stack(
          children: [
            // Image
            SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie?.posterPath ??
                      actor?.profilePath ??
                      '', // Use empty string if null
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return Padding(
                        padding: EdgeInsets.all(0.8),
                        child: Center(
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
            // Gradient overlay
            SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.7, 1.0],
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ),
            ),
            // Title and score
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie?.title ?? actor?.name ?? 'Unknown Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text(
                      movie != null
                          ? '${(movie!.voteAverage * 10).toInt()}% User score'
                          : actor?.character ?? 'no data available',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
