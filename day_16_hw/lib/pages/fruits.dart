import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/add_new_dialog.dart';
import '../components/fruit_tile.dart';

List<Map<String, dynamic>> fruits = [
  // {
  //   "qty": 9,
  //   "name": "Apple",
  // },
  // {
  //   "qty": 19,
  //   "name": "Banana",
  // },
  // {
  //   "qty": 90,
  //   "name": "Guava",
  // },
  // {
  //   "qty": 59,
  //   "name": "Radish",
  // },
];

class FruitsPage extends StatefulWidget {
  const FruitsPage({
    super.key,
  });

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  late SharedPreferences prefs;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      String? savedFruits = prefs.getString("fruits");
      if (savedFruits != null) {
        var decodedData = jsonDecode(savedFruits);
        for (var item in decodedData) {
          fruits.add(item as Map<String, dynamic>);
        }
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AddNewDialog(
                  onNewAdded: (a) {
                    // String op = "[5,8, \"ram\"]";
                    // print(jsonEncode([5, 8, "ram"]));
                    // print(jsonEncode({
                    //   "qty": 1,
                    //   "name": a,
                    //   "height": 56.0,
                    //   "colors": ["red", 'white', "green"],
                    //   "isEdible": 5 == 5,
                    //   "copy": {
                    //     "qty": 1,
                    //     "name": a,
                    //     "height": 56.0,
                    //     "colors": ["red", 'white', "green"],
                    //     "isEdible": 5 == 5
                    //   }
                    // }));
                    if (a != null && a.isNotEmpty) {
                      fruits.add({"qty": 1, "name": a});
                    }
                    setState(() {});
                    String jsonEncodedFruits = jsonEncode(fruits);
                    prefs.setString("fruits", jsonEncodedFruits);
                  },
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            return FruitTile(
              fruitName: fruits[index]['name'],
              quantity: fruits[index]['qty'],
            );
          }),
    );
  }
}
