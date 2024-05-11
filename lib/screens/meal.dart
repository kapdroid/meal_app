import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.title, this.meals, {super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    var content = Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          ...meals.map((data) => Text(
                data.title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ))
        ],
      ),
    );

    if (meals.isEmpty) {
      content = Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Text(
          "Uh... oh no data preset for $title",
          style: Theme.of(context)
              .textTheme!
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )),
      );
    }
    return content;
  }
}
