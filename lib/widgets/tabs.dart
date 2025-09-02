import 'package:flutter/material.dart';
import 'package:internal/screens/categoty.dart';
import 'package:internal/screens/meals.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen();
    String activeTitle = "Categories";

    if (selectedIndex == 1) {
      activeScreen = MealsScreen(meals: []);
      activeTitle = "Your Favotites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectIndex,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
