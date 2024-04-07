import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Column(
        children: [
          Icon(Icons.add),
          Text("Hello again"),
          Icon(Icons.add_moderator_outlined),
          Icon(Icons.add_moderator_outlined),
          Row(
            children: [
              Icon(Icons.add),
              Text("Hello again"),
              Icon(Icons.add_moderator_outlined),
              Icon(Icons.add_moderator_outlined),
            ],
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Hello There",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 5.6,
        leading: Icon(Icons.add_moderator_outlined),
        actions: [
          Icon(Icons.add_moderator_outlined),
          Icon(Icons.add_moderator_outlined),
          Icon(Icons.add_moderator_outlined),
        ],
      ),
    ),
  ));
}
