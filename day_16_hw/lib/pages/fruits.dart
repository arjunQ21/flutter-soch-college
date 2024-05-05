import 'package:flutter/material.dart';

import '../components/add_new_dialog.dart';
import '../components/fruit_tile.dart';

List<Map<String, dynamic>> fruits = [
  {
    "qty": 9,
    "name": "Apple",
  },
  {
    "qty": 19,
    "name": "Banana",
  },
  {
    "qty": 90,
    "name": "Guava",
  },
  {
    "qty": 59,
    "name": "Radish",
  },
];

class FruitsPage extends StatelessWidget {
  const FruitsPage({
    super.key,
  });

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
                builder: (context) => AddNewDialog(),
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
