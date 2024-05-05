import 'package:flutter/material.dart';

class FruitTile extends StatefulWidget {
  final String fruitName;
  final int quantity;
  const FruitTile({
    super.key,
    required this.fruitName,
    required this.quantity,
  });

  @override
  State<FruitTile> createState() => _FruitTileState();
}

class _FruitTileState extends State<FruitTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(widget.fruitName), Text(widget.quantity.toString())],
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
