import 'package:flutter/material.dart';
import 'package:todo_with_signals/view/add_todo_view.dart';
import 'package:todo_with_signals/view/todo_list_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.black, foregroundColor: Colors.yellow)),
      routes: {
        "/": (_) => const TodoListView(),
        "/add-todo": (_) => const AddTodoView(),
      },
    );
  }
}
