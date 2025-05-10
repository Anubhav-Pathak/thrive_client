import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/discover/presentation/bloc/discover_cubit.dart';
import 'package:thrive_client/features/discover/presentation/bloc/discover_state.dart';
import 'package:thrive_client/features/discover/presentation/widgets/skeletons/story_carousel_skeleton.dart';
import 'package:thrive_client/features/discover/presentation/widgets/story_card.dart';

class StoryCarousel extends StatefulWidget {
  const StoryCarousel({super.key});

  @override
  State<StoryCarousel> createState() => _StoryCarouselState();
}

class _StoryCarouselState extends State<StoryCarousel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        if (state is DiscoverLoading) {
          return const StoryCarouselSkeleton();
        } else if (state is DiscoverGameLoading) {
          return const SizedBox(
            height: 368,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DiscoverError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is DiscoverLoaded && state.discover != null && state.discover!.stories.isNotEmpty) {
          return SizedBox(
            height: 368,
            child: CarouselView(
              itemExtent: MediaQuery.sizeOf(context).width * 0.6,
              shrinkExtent: MediaQuery.sizeOf(context).width * 0.6,
              children: state.discover!.stories.map((story) => StoryCard(story: story)).toList(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
