import 'package:flutter/material.dart';

class AddNewDialog extends StatelessWidget {
  AddNewDialog({
    super.key,
  });

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add New Fruit"),
      content: TextField(
        controller: textEditingController,
        decoration: InputDecoration(labelText: "Enter Fruit Name: "),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: Colors.red,
            )),
        IconButton(
            onPressed: () {
              if (textEditingController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Enter something first")));
                return;
              }
            },
            icon: Icon(
              Icons.check,
              color: Colors.green,
            )),
      ],
    );
  }
}
