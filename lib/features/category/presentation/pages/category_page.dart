import 'package:flutter/material.dart';
import 'package:thrive_client/features/category/presentation/widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<CategoryItem> categories = [
    CategoryItem("Mental Health", Icons.health_and_safety, "assets/images/starry_night.jpg"),
    CategoryItem("STEM Learning", Icons.science, "assets/images/starry_night.jpg"),
    CategoryItem("Climate Awareness", Icons.eco, "assets/images/starry_night.jpg"),
    CategoryItem("Physical Fitness", Icons.fitness_center, "assets/images/starry_night.jpg"),
    CategoryItem("Language Learning", Icons.language, "assets/images/starry_night.jpg"),
    CategoryItem("Wildlife Conservation", Icons.nature, "assets/images/starry_night.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          },
        ),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final String imagePath;

  CategoryItem(this.title, this.icon, this.imagePath);
}
