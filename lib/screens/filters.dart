import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(this.appliedFilter, {super.key});

  Map<FilterType, bool> appliedFilter;

  @override
  State<StatefulWidget> createState() {
    return FiltersState();
  }
}

class FiltersState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;
  @override
  void initState() {
    _glutenFreeFilterSet=widget.appliedFilter[FilterType.glutenFree]!;
    _lactoseFreeFilterSet=widget.appliedFilter[FilterType.lactoseFree]!;
    _vegetarianFilterSet=widget.appliedFilter[FilterType.vegetarian]!;
    _veganFilterSet=widget.appliedFilter[FilterType.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filters",
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          print("didScope$didPop");
          if (didPop) {
            return;
          } else {
            Navigator.of(context).pop({
              FilterType.glutenFree: _glutenFreeFilterSet,
              FilterType.lactoseFree: _lactoseFreeFilterSet,
              FilterType.vegetarian: _vegetarianFilterSet,
              FilterType.vegan: _veganFilterSet,
            });
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _glutenFreeFilterSet = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _lactoseFreeFilterSet = value;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (value) {
                setState(() {
                  _vegetarianFilterSet = value;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (value) {
                setState(() {
                  _veganFilterSet = value;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
