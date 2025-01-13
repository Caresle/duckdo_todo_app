import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:duckdo_todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatelessWidget {
  final TodoEntity todo;

  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = !todo.completed ? Colors.white : Colors.black;
    final textColor = !todo.completed ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: todo.completed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    activeColor: Colors.black,
                    checkColor: Colors.black,
                    onChanged: (value) {
                      final newTodo = todo.copyWith(completed: value);
                      final todoProvider = context.read<TodoProvider>();

                      todoProvider.update(newTodo);
                    },
                  ),
                  Text(
                    todo.task,
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(backgroundColor),
                    overlayColor:
                        WidgetStatePropertyAll(textColor.withAlpha(75))),
                onPressed: () {
                  final todoProvider = context.read<TodoProvider>();

                  todoProvider.delete(todo);
                },
                child: Icon(Icons.delete_rounded, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
