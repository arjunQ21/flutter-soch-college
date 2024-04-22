import 'package:flutter/material.dart';

import 'main.dart';

class ListsWithBuilder extends StatefulWidget {
  const ListsWithBuilder({super.key});

  @override
  State<ListsWithBuilder> createState() => _ListsWithBuilderState();
}

class _ListsWithBuilderState extends State<ListsWithBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List with builder")),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              fruits[index] = fruits[index] + "o";
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$index: ${fruits[index]}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}