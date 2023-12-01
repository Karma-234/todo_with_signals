import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_with_signals/service/todo.dart';
import 'package:todo_with_signals/view/add_todo_view.dart';
import 'package:todo_with_signals/widget/todo_card.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = computed(() => todoService.todos.value.isEmpty);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo app',
            style: GoogleFonts.markaziText(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddTodoView(),
            ));
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Watch(
            (_) => isEmpty.value
                ? Center(
                    child: Text(
                      'You have no todos.',
                      style: GoogleFonts.markaziText(fontSize: 28),
                    ),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemCount: todoService.todos.value.length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child:
                              TodoCard(todoModel: todoService.todos.value[i]),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
