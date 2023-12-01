import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';

void main() {
  runApp(const MainApp());
}

final text = signal('');

final todos = signal(<String>[]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = computed(() => todos.value.isEmpty);
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
              onChanged: (value) {
                text.value = value;
                debugPrint(text.value);
              },
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
                              itemCount: todos.value.length,
                              itemBuilder: (context, index) => PhysicalModel(
                                color: Colors.black,
                                elevation: 10,
                                child: SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.yellow,
                                      ),
                                      color: Colors.amber,
                                    ),
                                    child: Center(
                                      child: Text(
                                        todos.value[index],
                                        style: GoogleFonts.sriracha(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              PhysicalModel(
                color: Colors.black,
                elevation: 10,
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                      ),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: Watch((_) => Text(
                            text.value,
                            style: GoogleFonts.sriracha(),
                          )),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (text.value.isNotEmpty) {
                    final init = todos.value;
                    todos.value = [text.value, ...init];
                  }
                  text.value = "";
                },
                child: const Text('Add Todo'),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
