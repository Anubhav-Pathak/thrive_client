import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/core/router/routes.dart';
import 'package:thrive_client/features/discover/presentation/bloc/discover_cubit.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key});

  void navigateTo(BuildContext context, String route) {
    context.read<DiscoverCubit>().quickNavigateTo(route);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              IconButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  shape: const WidgetStatePropertyAll(
                    CircleBorder(),
                  ),
                ),
                onPressed: () => navigateTo(context, Routes.category),
                icon: Icon(
                  Icons.category,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Category",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              IconButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  shape: const WidgetStatePropertyAll(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Search",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              IconButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  shape: const WidgetStatePropertyAll(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Calendar",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              IconButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  shape: const WidgetStatePropertyAll(
                    CircleBorder(),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.leaderboard,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Leaderboard",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
