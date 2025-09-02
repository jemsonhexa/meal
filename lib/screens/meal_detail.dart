import 'package:flutter/material.dart';
import 'package:internal/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.mealItem});

  final Meal mealItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealItem.title, maxLines: 2)),

      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            Image.network(
              mealItem.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Text(
              "Ingrediants",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            for (final ingrediant in mealItem.ingredients)
              Text(
                ingrediant,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            Divider(),
            Text(
              "Steps:",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            for (final steps in mealItem.steps)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
