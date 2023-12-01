import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_with_signals/model/todo.dart';
import 'package:todo_with_signals/utils/extension.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback onDelete;
  final VoidCallback onComplete;
  const TodoCard(
      {super.key,
      required this.todoModel,
      required this.onDelete,
      required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      elevation: 10,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onComplete,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 50),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: Colors.amber,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          4.v,
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
                ),
              ),
            ),
            InkWell(
              onTap: onDelete,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.black38,
                    size: 38,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
