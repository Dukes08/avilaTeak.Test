import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:avilatek_test/domain/entities/movie.dart';
import 'package:avilatek_test/presentation/providers/actors/actor_profile_provider.dart';
import 'package:avilatek_test/presentation/providers/actors/movies_by_actors_provider.dart';
import 'package:avilatek_test/presentation/widgets/actors/custom_profile_appbar.dart';
import 'package:avilatek_test/presentation/widgets/movies/movies_vertical_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorProfileScreen extends ConsumerStatefulWidget {
  static const name = 'actor-profile';
  final String actorId;
  const ActorProfileScreen({super.key, required this.actorId});

  @override
  ActorProfileScreenState createState() => ActorProfileScreenState();
}

class ActorProfileScreenState extends ConsumerState<ActorProfileScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    ref.read(actorsByIdProvider.notifier).loadActor(widget.actorId);
    ref.read(moviesByActorProvider.notifier).loadMovies(widget.actorId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Actor? actorProfile = ref.watch(actorsByIdProvider)[widget.actorId];
    List<Movie>? moviesByActor =
        ref.watch(moviesByActorProvider)[widget.actorId];

    if (actorProfile == null || moviesByActor == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomProfileAppbar(actor: actorProfile),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 12),
              child: Text(
                'Casted on',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          MoviesVerticalListview(
            movies: moviesByActor,
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}
