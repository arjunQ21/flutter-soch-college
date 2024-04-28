class Todo {
  String title;
  bool isCompleted;

  Todo({this.isCompleted = false, required this.title}) {
    all.add(this);
  }
// Todo.title
// Todo.all
  static List<Todo> all = [];
}
