import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:duckdo_todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppTheme.primary,
      shape: CircleBorder(),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: AppTheme.secondary,
              title: Text('New Task'),
              content: TextFormField(
                controller: textEditingController,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      textEditingController.text = '';
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppTheme.primary),
                    )),
                FilledButton(
                  onPressed: () async {
                    final todoProvider = context.read<TodoProvider>();
                    final TodoEntity todo = TodoEntity(
                        id: 0,
                        task: textEditingController.text,
                        completed: false);
                    await todoProvider.create(todo);
                    textEditingController.text = '';
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppTheme.primary),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: AppTheme.secondary),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Icon(
        Icons.add_rounded,
        color: AppTheme.secondary,
      ),
    );
  }
}
