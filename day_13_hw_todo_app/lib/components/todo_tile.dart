import 'package:day_13_hw_todo_app/classes/todo.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final Function(bool) onStatusChange;
  final Todo todo;
  const TodoTile({super.key, required this.todo, required this.onStatusChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(color: todo.isCompleted ? Colors.green : null),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                onStatusChange(!todo.isCompleted);
              },
              icon: Icon(!todo.isCompleted ? Icons.check : Icons.check_box),
            ),
            IconButton(
              onPressed: () {
                Todo.all.removeWhere((element) => element.title == todo.title);
                onStatusChange(!todo.isCompleted);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 2),
              color: Colors.black.withOpacity(0.4))
        ],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
