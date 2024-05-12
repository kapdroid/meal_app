import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal.dart';
import 'package:meal_app/widgets/item_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(this.mealList,
      {super.key, required this.toggleFavourite});

  final Function(Meal) toggleFavourite;
  final List<Meal> mealList;

  void _selectCategory(BuildContext context, Category category) {
    final filteredCategories = mealList
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              filteredCategories,
              toggleFavourite,
              title: category.title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      children: [
        for (Category category in availableCategories)
          CategoryItems(category, () {
            _selectCategory(context, category);
          })
      ],
    ));
  }
}
