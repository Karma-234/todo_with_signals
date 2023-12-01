import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_with_signals/model/todo.dart';

@immutable
class TodoService {
  final MutableSignal<List<TodoModel>> todos = <TodoModel>[].toSignal();

  void addTodo(TodoModel model) {
    final List<TodoModel> tempList = todos.value;
    todos.value = [model, ...tempList];
  }
}
