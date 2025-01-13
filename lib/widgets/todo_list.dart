import 'package:duckdo_todo/providers/todo_provider.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
        if (value.todos.isEmpty) return Text('EMPTY');

        final todos = value.todos;
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoCard(todo: todos[index]);
          },
        );
      },
    );
  }
}
