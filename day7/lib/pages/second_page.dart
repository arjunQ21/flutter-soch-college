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
        title: Text(this.tableNumber.toString()),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hello From Second Page"),
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