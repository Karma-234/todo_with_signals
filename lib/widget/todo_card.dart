import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_with_signals/model/todo.dart';
import 'package:todo_with_signals/utils/extension.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todoModel;
  const TodoCard({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      elevation: 10,
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(minHeight: 100, minWidth: double.infinity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.yellow,
            ),
            color: Colors.amber,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                todoModel.title,
                style: GoogleFonts.sriracha(
                    fontSize: 24,
                    decoration: todoModel.isCompleted
                        ? TextDecoration.lineThrough
                        : null),
              ),
              12.v,
              Text(
                todoModel.todo,
                style: GoogleFonts.sriracha(
                    decoration: todoModel.isCompleted
                        ? TextDecoration.lineThrough
                        : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
