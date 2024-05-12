import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:meal_app/widgets/item_meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.meals, this._toggleFavourite, {super.key, this.title});

  final String? title;
  final List<Meal> meals;
  final Function(Meal) _toggleFavourite;

  void _goToMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal, _toggleFavourite)));
  }

  @override
  Widget build(BuildContext context) {
    var content = Scaffold(
        appBar: title != null
            ? AppBar(
                title: Text(title!),
              )
            : null,
        body: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(meals[index], () {
                  _goToMeal(context, meals[index]);
                }))
        /* Column(
        children: [
          ...meals.map(
            (data) => MealItem(data),
          )
        ],
      ),*/
        );

    if (meals.isEmpty) {
      content = Scaffold(
        appBar:  title != null
            ? AppBar(
          title: Text(title!),
        )
            : null,
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
