import "package:day_13_hw_todo_app/classes/todo.dart";
import "package:flutter/material.dart";

import "pages/todos_page.dart";

void main() {
  Todo(title: "First one");
  Todo(title: "Second one");
  Todo(title: "Third one");
  Todo(title: "Fourth one");
  Todo(title: "Fifth one");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodosPage(),
    ),
  );
}
