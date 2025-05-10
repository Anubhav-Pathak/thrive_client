import 'package:flutter/material.dart';
import 'package:thrive_client/features/category/presentation/pages/category_page.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItem category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(category.imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 50,
                height: 3,
                color: Theme.of(context).colorScheme.surface,
              )),
          Center(
            child: Icon(
              category.icon,
              color: Theme.of(context).colorScheme.surface,
              size: 48,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
