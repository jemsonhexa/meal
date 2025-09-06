import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelected});

  final void Function(String title) onSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.category_sharp),
                SizedBox(width: 20),
                Text("Menu"),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.no_meals),
            title: Text("meals"),
            onTap: () {
              onSelected("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("filters"),
            onTap: () {
              onSelected("filters");
            },
          ),
        ],
      ),
    );
  }
}
