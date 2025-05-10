import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/discover/presentation/bloc/discover_cubit.dart';
import 'package:thrive_client/features/discover/presentation/widgets/quick_links.dart';
import 'package:thrive_client/features/discover/presentation/widgets/story_carousel.dart';
import 'package:thrive_client/features/discover/presentation/widgets/summary.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key, required this.category});

  final String? category;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DiscoverCubit()..init(category),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discover",
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 16),
                          const Summary(),
                          const SizedBox(height: 24),
                          const QuickLinks(),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Excercise",
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                              ),
                              const Spacer(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.transparent,
                                ),
                                onPressed: () {},
                                child: RichText(
                                  text: TextSpan(
                                    text: "View All",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                    children: [
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 16,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: StoryCarousel(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
