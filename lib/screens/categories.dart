import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meal.dart';
import 'package:meal_app/widgets/item_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealsScreen("Indian", [])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Your Category"),
        ),
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
                _selectCategory(context);
              })
          ],
        ));
  }
}
