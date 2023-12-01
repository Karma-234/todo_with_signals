import 'package:flutter/material.dart';

@immutable
class TodoModel {
  String title;
  String todo;
  bool isCompleted;

  TodoModel(
      {required this.todo, this.isCompleted = false, required this.title});

  TodoModel copyWith({String? title, String? todo, bool? isCompleted}) =>
      TodoModel(
          todo: todo ?? this.todo,
          title: title ?? this.title,
          isCompleted: isCompleted ?? this.isCompleted);
}
