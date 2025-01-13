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
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(color: Colors.white),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
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
                      style: TextStyle(color: Colors.black),
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
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Icon(
        Icons.add_rounded,
        color: Colors.white,
      ),
    );
  }
}
