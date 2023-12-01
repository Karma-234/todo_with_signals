import 'package:signals/signals_flutter.dart';
import 'package:todo_with_signals/model/todo.dart';

class TodoService {
  final MutableSignal<List<TodoModel>> todos = <TodoModel>[].toSignal();

  void addTodo(TodoModel model) {
    final List<TodoModel> tempList = todos.value;
    todos.value = [model, ...tempList];
  }

  void deleteTodo(TodoModel model) {
    final templList = todos.value;
    templList.remove(model);
    todos.value = templList;
  }

  void markAsCompleted(TodoModel model) {
    todos.value = todos.value
        .map((e) => e == model ? e.copyWith(isCompleted: true) : e)
        .toList();
  }
}
