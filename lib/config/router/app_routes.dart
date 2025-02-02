import 'package:avilatek_test/presentation/screens/actor_profile_screen.dart';
import 'package:avilatek_test/presentation/screens/home_screen.dart';
import 'package:avilatek_test/presentation/screens/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(
              movieId: movieId,
            );
          },
        ),
        GoRoute(
          path: 'actor/:actorId',
          name: ActorProfileScreen.name,
          builder: (context, state) {
            final actorId = state.pathParameters['actorId'] ?? 'no-id';
            return ActorProfileScreen(
              actorId: actorId,
            );
          },
        )
      ],
    ),
  ],
);
