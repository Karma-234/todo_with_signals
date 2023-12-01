import 'package:flutter/material.dart';
// import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_with_signals/view/todo_list_view.dart';

void main() {
  runApp(const TodoListView());
}

final text = signal('');

final todos = signal(<String>[]);
