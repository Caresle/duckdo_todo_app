import 'package:duckdo_todo/config/environment.dart';
import 'package:duckdo_todo/providers/todo_provider.dart';
import 'package:duckdo_todo/widgets/add_todo.dart';
import 'package:duckdo_todo/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Environment.initEnvironment();
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
    child: MyApp(),
  ));
  await Supabase.initialize(
      url: Environment.supabaseUrl, anonKey: Environment.supabaseAnon);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>();
    todoProvider.getAll();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DuckDo Todo',
      home: Scaffold(
          backgroundColor: Color.fromRGBO(226, 232, 240, 1),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: TodoList(),
          )),
          floatingActionButton: AddTodo()),
    );
  }
}
