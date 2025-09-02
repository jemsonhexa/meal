import 'package:flutter/material.dart';
import 'package:internal/models/meal.dart';
import 'package:internal/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });
  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  String get tranformComplextyText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get tranformAffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () {
            onSelectedMeal(meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black38,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 44),
                    child: Column(
                      spacing: 15,
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MealItemTrait(
                              icon: Icons.schedule_outlined,
                              title: "${meal.duration} min",
                            ),
                            MealItemTrait(
                              icon: Icons.work,
                              title: tranformComplextyText,
                            ),
                            MealItemTrait(
                              icon: Icons.money,
                              title: tranformAffordabilityText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
