import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var gluttenFree = false;
  var sugarFree = false;
  var vegeterian = false;
  var vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters")),
      body: Column(
        children: [
          //gluitten
          SwitchListTile(
            value: gluttenFree,
            onChanged: (value) {
              setState(() {
                gluttenFree = value;
              });
            },
            title: Text("Glutten -Free"),
            subtitle: Text("This is a Glutten free product"),
            activeColor: Colors.green,
          ),

          //sugarfree
          SwitchListTile(
            value: sugarFree,
            onChanged: (value) {
              setState(() {
                sugarFree = value;
              });
            },
            title: Text("sugar-Free"),
            subtitle: Text("This is a sugarFree product"),
            activeColor: Colors.green,
          ),

          //vegeta
          SwitchListTile(
            value: vegeterian,
            onChanged: (value) {
              setState(() {
                vegeterian = value;
              });
            },
            title: Text("Vegeterian"),
            subtitle: Text("This is a vegeterian product"),
            activeColor: Colors.green,
          ),

          //vegen
          SwitchListTile(
            value: vegan,
            onChanged: (value) {
              setState(() {
                vegan = value;
              });
            },
            title: Text("vegan"),
            subtitle: Text("This is a vegan product"),
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
