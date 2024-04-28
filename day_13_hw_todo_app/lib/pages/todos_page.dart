import 'package:day_13_hw_todo_app/components/todo_tile.dart';
import 'package:day_13_hw_todo_app/pages/add_todo_page.dart';
import 'package:flutter/material.dart';

import '../classes/todo.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({
    super.key,
  });

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < Todo.all.length; i++)
              TodoTile(
                todo: Todo.all[i],
                onStatusChange: (td) {
                  print("Status changed of todo: " + Todo.all[i].title);
                  Todo.all[i].isCompleted = !Todo.all[i].isCompleted;
                  setState(() {});
                },
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var utaBataAayeko = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNewTodo()));
          print("Back vayera aayo");
          print("Uta bata aayeko: " + utaBataAayeko.toString());
          if (utaBataAayeko != null) {
            Todo(title: utaBataAayeko.toString());
            setState(() {});
          }
        },
      ),
    );
  }
}
