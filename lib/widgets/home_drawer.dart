import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer(this.drawerCallBack, {super.key});

  final Function(String) drawerCallBack;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ])),
            child: Row(
              children: [
                Icon(
                  size: 40,
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  "Cooking Up!",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              drawerCallBack("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              drawerCallBack("filters");
            },
          )
        ],
      ),
    );
  }
}
