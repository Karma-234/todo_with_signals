import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_with_signals/service/todo.dart';
import 'package:todo_with_signals/widget/todo_card.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = computed(() => todoService.todos.value.isEmpty);
    return MaterialApp(
      home: Scaffold(
        bottomSheet: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.amber,
            ),
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                  border: InputBorder.none, enabledBorder: InputBorder.none),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Watch(
                (_) => isEmpty.value
                    ? const SizedBox.shrink()
                    : Flexible(
                        child: CustomScrollView(
                          slivers: [
                            SliverList.builder(
                              itemCount: todoService.todos.value.length,
                              itemBuilder: (context, i) => TodoCard(
                                  todoModel: todoService.todos.value[i]),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
