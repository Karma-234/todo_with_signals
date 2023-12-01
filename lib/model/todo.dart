import 'package:flutter/material.dart';

@immutable
class TodoModel {
  final String title;
  final String todo;
  final bool isCompleted;

  const TodoModel(
      {required this.todo, this.isCompleted = false, required this.title});

  TodoModel copyWith({String? title, String? todo, bool? isCompleted}) =>
      TodoModel(
          todo: todo ?? this.todo,
          title: title ?? this.title,
          isCompleted: isCompleted ?? this.isCompleted);
}
