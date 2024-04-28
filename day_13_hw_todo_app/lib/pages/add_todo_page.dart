import 'package:day_13_hw_todo_app/classes/todo.dart';
import 'package:flutter/material.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  TextEditingController controller = TextEditingController();

  // void _changeListener

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print("New Value: ${controller.text}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SizedBox(
            height: 80,
            child: TextField(
              controller: controller,
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: controller.text.length > 0
              ? () {
                  // Todo(title: controller.text);
                  Navigator.of(context).pop(controller.text);
                }
              : null,
          child: Text("Add This Todo"),
        ),
      ),
    );
  }
}
