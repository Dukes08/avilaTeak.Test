import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/presentation/widgets/movies/slide.dart';
import 'package:flutter/material.dart';

class MovieDetailPopup extends StatelessWidget {
  final String title;
  final num userScore;
  final List<Actor> actors;

  const MovieDetailPopup({
    super.key,
    required this.title,
    required this.userScore,
    required this.actors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              color: Colors.white,
            ),
          ),
          Text(
            '${(userScore * 10).toInt()}% User score',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 21),
          if (actors.isNotEmpty)
            SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: actors.take(3).map((actor) {
                  return Expanded(
                    child: SizedBox(
                      child: Slide(actor: actor),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
