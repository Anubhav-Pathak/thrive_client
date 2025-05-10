import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/discover/domain/entities/story_entity.dart';
import 'package:thrive_client/features/discover/presentation/bloc/discover_cubit.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
  });

  final StoryEntity story;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/starry_night.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.6, 1],
                colors: [
                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
                  Theme.of(context).colorScheme.surface.withOpacity(0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 64,
                  child: Text(
                    story.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  story.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    context.read<DiscoverCubit>().loadGame(story);
                  },
                  child: Text(
                    "Let's Go!",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
