import 'package:flutter/material.dart';
import 'package:internal/models/category.dart';
import 'package:internal/models/dummy_category.dart';
import 'package:internal/screens/meals.dart';
import 'package:internal/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void selectCategory(BuildContext context, Category category) {
    final filteredmeals = dummyMeals.where(
      (meal) => meal.categories.contains(category.id),
    ); //return true if meal contain cate id
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: category.title, meals: filteredmeals.toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              selectCategory: () {
                selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
