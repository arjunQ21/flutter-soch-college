// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:day_16_hw/helpers/functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/add_new_dialog.dart';
import '../components/fruit_tile.dart';

List<Map<String, dynamic>> fruits = [];

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
          if ((item as Map).containsKey("id")) {
            fruits.add(item as Map<String, dynamic>);
          } else {
            fruits.add({
              "id": giveMeNewId(),
              "name": item['name'],
              "qty": item['qty']
            });
          }
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
                    if (a != null && a.isNotEmpty) {
                      fruits.add(
                        {
                          "qty": 1,
                          "name": a,
                          "id": giveMeNewId(),
                        },
                      );
                    }
                    setState(() {});
                    saveFruitsToLocalStorage();
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
      body: Column(
        children: [
          for (var index = 0; index < fruits.length; index++)
            FruitTile(
              fruitDetails: fruits[index],
            )
        ],
      ),
    );
  }
}
