import 'package:flutter/material.dart';
import 'package:thrive_client/core/utils/constant/enums.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/discover/domain/entities/story_entity.dart';
import 'package:thrive_client/features/discover/presentation/widgets/story_card.dart';

class StoryCarousel extends StatefulWidget {
  const StoryCarousel({super.key});

  @override
  State<StoryCarousel> createState() => _StoryCarouselState();
}

class _StoryCarouselState extends State<StoryCarousel> {
  late final List<StoryEntity> stories;

  @override
  void initState() {
    // TODO: Initialise stories
    stories = [
      Story(
        id: '1',
        title: 'The Adventure Begins',
        description: 'Join the hero on an epic journey through unknown lands.',
        imageUrl: 'https://picsum.photos/200/300.webp',
        type: StoryType.educative,
        status: Status.inProgress,
        createdAt: DateTime.now().subtract(Duration(days: 10)),
        lastPlayedAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      Story(
        id: '2',
        title: 'Mystery of the Lost City',
        description: 'Uncover the secrets of the ancient lost city.',
        imageUrl: 'https://picsum.photos/200/300.webp',
        type: StoryType.educative,
        status: Status.notStarted,
        createdAt: DateTime.now().subtract(Duration(days: 20)),
        lastPlayedAt: DateTime.now().subtract(Duration(days: 5)),
      ),
      Story(
        id: '3',
        title: 'Space Odyssey',
        description: 'Explore the vastness of space and discover new worlds.',
        imageUrl: 'https://picsum.photos/200/300.webp',
        type: StoryType.health,
        status: Status.notStarted,
        createdAt: DateTime.now().subtract(Duration(days: 30)),
        lastPlayedAt: DateTime.now().subtract(Duration(days: 10)),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 348,
      child: CarouselView(
        itemExtent: MediaQuery.sizeOf(context).width * 0.6,
        shrinkExtent: MediaQuery.sizeOf(context).width * 0.6,
        children: stories.map((story) => StoryCard(story: story)).toList(),
      ),
    );
  }
}
