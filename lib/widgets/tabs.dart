import 'package:flutter/material.dart';
import 'package:internal/models/meal.dart';
import 'package:internal/screens/categoty.dart';
import 'package:internal/screens/filters.dart';
import 'package:internal/screens/meals.dart';
import 'package:internal/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;

  final List<Meal> favItems = [];

  void selectIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void toogleFav(Meal meal) {
    final isFav = favItems.contains(meal);

    if (isFav) {
      setState(() {
        favItems.remove(meal);
      });
    } else {
      setState(() {
        favItems.add(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen();
    String activeTitle = "Categories";

    if (selectedIndex == 1) {
      activeScreen = MealsScreen(meals: []);
      activeTitle = "Your Favotites";
    }

    void setScreen(String page) {
      Navigator.pop(context);
      if (page == 'filters') {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => FilterScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      drawer: MainDrawer(onSelected: setScreen),
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
