import 'package:duckdo_todo/config/app_theme.dart';
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
        if (value.isLoading) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppTheme.primary,
                  ),
                  Text('Loading todos')
                ],
              ),
            ],
          );
        }
        if (value.todos.isEmpty) return Text('EMPTY');

        final todos = value.todos;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Hide completed task'), CustomSwitch()],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoCard(todo: todos[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
