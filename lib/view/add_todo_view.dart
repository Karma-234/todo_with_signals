import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_with_signals/model/todo.dart';
import 'package:todo_with_signals/service/todo.dart';
import 'package:todo_with_signals/utils/extension.dart';
import 'package:todo_with_signals/widget/todo_input_field.dart';

final _todoTitle = signal('');
final _todoDescription = signal('');
final _isValid = computed(
  () => _todoTitle.value.isNotEmpty && _todoDescription.value.isNotEmpty,
);
void _reset() {
  _todoDescription.value = '';
  _todoTitle.value = '';
}

class AddTodoView extends StatelessWidget {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add todo',
          style: GoogleFonts.markaziText(fontSize: 24),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TododInputField(
              hint: 'Title...',
              onChanged: (v) => _todoTitle.value = v,
            ),
            12.v,
            TododInputField(
              hint: 'Description...',
              onChanged: (v) => _todoDescription.value = v,
            ),
            const Spacer(),
            Watch((_) {
              return ElevatedButton(
                onPressed: _isValid.value
                    ? () {
                        final newTodo = TodoModel(
                            todo: _todoDescription.value,
                            title: _todoTitle.value);
                        todoService.addTodo(newTodo);
                        _reset();
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.black12,
                  disabledForegroundColor: Colors.black12.withOpacity(0.3),
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.markaziText(
                      color: Colors.yellow, fontSize: 22),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
