
import 'package:flutter/material.dart';

import 'main.dart';

class ListsWithColumn extends StatefulWidget {
  const ListsWithColumn({
    super.key,
  });

  @override
  State<ListsWithColumn> createState() => _ListsWithColumnState();
}

class _ListsWithColumnState extends State<ListsWithColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Demo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < fruits.length; i++)
            InkWell(
              onTap: () {
                fruits[i] = fruits[i] + "o";
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fruits[i],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
