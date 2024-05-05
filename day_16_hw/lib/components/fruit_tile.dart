import 'package:day_16_hw/helpers/functions.dart';
import 'package:flutter/material.dart';

import '../pages/fruits.dart';

class FruitTile extends StatefulWidget {
  final Map<String, dynamic> fruitDetails;
  const FruitTile({
    super.key,
    required this.fruitDetails,
  });

  @override
  State<FruitTile> createState() => _FruitTileState();
}

class _FruitTileState extends State<FruitTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(widget.fruitDetails['id']),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          fruits = removeById(widget.fruitDetails['id']);
          saveFruitsToLocalStorage();
        }
        setState(() {});
      },
      child: InkWell(
        onTap: () {
          setState(() {
            Map<String, dynamic>? obtainedFruit =
                giveMeFruitById(widget.fruitDetails['id']);
            if (obtainedFruit != null) {
              obtainedFruit['qty'] = obtainedFruit['qty'] + 1;
              saveFruitsToLocalStorage();
            }
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.fruitDetails['name']),
              // Text(widget.fruitDetails['id'].toString()),
              Text(widget.fruitDetails['qty'].toString())
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
