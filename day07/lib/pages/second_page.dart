import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  int tableNumber;
  SecondPage({
    super.key,
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table of $tableNumber"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 10; i++)
            Text("$tableNumber * $i = ${tableNumber * i}"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
        ],
      )),
    );
  }
}
