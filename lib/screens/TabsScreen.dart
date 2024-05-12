import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meal.dart';
import 'package:meal_app/widgets/home_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

const kInitialFilter = {
  FilterType.glutenFree: false,
  FilterType.lactoseFree: false,
  FilterType.vegetarian: false,
  FilterType.vegan: false,
};

class _TabsScreenState extends State<TabsScreen> {
  var index = 0;
  final List<Meal> _favouritesMeals = [];
  late Widget selectedScreen;
  late String titleName;
  Map<FilterType, bool> appliedFilter = kInitialFilter;

  void _selectTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavouriteListUpdate(Meal meal) {
    final isExisting = _favouritesMeals.contains(meal);
    setState(() {
      if (isExisting) {
        _favouritesMeals.remove(meal);
        _showSnackBar("Removed from favourites");
      } else {
        _favouritesMeals.add(meal);
        _showSnackBar("Added as Favourites");
      }
    });
  }

  void _drawerCallBack(String callback) async {
    Navigator.pop(context);
    if (callback == "filters") {
      var result = await Navigator.of(context).push<Map<FilterType, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen(appliedFilter)));
      setState(() {
        appliedFilter = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMealList = dummyMeals.where((meal) {
      if ((appliedFilter[FilterType.glutenFree]! && !meal.isGlutenFree)) {
        return false;
      }
      if ((appliedFilter[FilterType.vegan]! && !meal.isVegan)) {
        return false;
      }
      if ((appliedFilter[FilterType.vegetarian]! && !meal.isVegetarian)) {
        return false;
      }
      if ((appliedFilter[FilterType.lactoseFree]! && !meal.isLactoseFree)) {
        return false;
      }
      return true;
    }).toList();
    selectedScreen = index == 0
        ? CategoriesScreen(filteredMealList,
            toggleFavourite: _toggleFavouriteListUpdate)
        : MealsScreen(_favouritesMeals, _toggleFavouriteListUpdate);
    titleName = index == 0 ? "Select Your Category" : "Favourites";
    return Scaffold(
      appBar: AppBar(
        title: Text(titleName),
      ),
      drawer: HomeDrawer(_drawerCallBack),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectTab(index),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
      body: selectedScreen,
    );
  }
}
