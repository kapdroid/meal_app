import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/extensions.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem(this.meal, this.onClick, {super.key});

  final Meal meal;
  void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onClick,
        child: Stack(
          children: [
            FadeInImage(
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(Icons.timer, "${meal.duration} min "),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            Icons.work, meal.complexity.name.capitalize()),
                        const SizedBox(width: 12),
                        MealItemTrait(Icons.currency_rupee,
                            meal.affordability.name.capitalize())
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
