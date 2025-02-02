import 'package:animate_do/animate_do.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:avilatek_test/presentation/widgets/movies/slide.dart';
import 'package:flutter/material.dart';

class MoviesVerticalListview extends StatelessWidget {
  final List<Movie> movies;
  final ScrollController scrollController;
  final VoidCallback? loadNextPage;

  const MoviesVerticalListview({
    super.key,
    required this.movies,
    required this.scrollController,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage!();
      }
    });

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 26,
        crossAxisSpacing: 1,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final isRightColumn = index % 2 != 0;

          return Align(
            alignment:
                isRightColumn ? Alignment.bottomCenter : Alignment.topCenter,
            child: Transform.translate(
              offset: isRightColumn ? Offset(0, 40) : Offset(0, 0),
              child: FadeInRight(
                child: Slide(movie: movies[index]),
              ),
            ),
          );
        },
        childCount: movies.length,
      ),
    );
  }
}
