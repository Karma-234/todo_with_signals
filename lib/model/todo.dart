class TodoModel {
  String title;
  String todo;
  bool isCompleted;

  TodoModel(
      {required this.todo, this.isCompleted = false, required this.title});
}
