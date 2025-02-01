import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:duckdo_todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatelessWidget {
  final TodoEntity todo;

  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        !todo.completed ? AppTheme.secondary : AppTheme.primary;
    final textColor = !todo.completed ? AppTheme.primary : AppTheme.secondary;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: size.height * .75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppTheme.secondary,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          todo.task.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter description",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
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
                          side: BorderSide(color: Colors.red)),
                      activeColor: AppTheme.secondary,
                      checkColor: AppTheme.primary,
                      onChanged: (value) {
                        final newTodo = todo.copyWith(completed: value);
                        final todoProvider = context.read<TodoProvider>();

                        todoProvider.update(newTodo);
                      },
                    ),
                    Text(
                      todo.task,
                      style: TextStyle(
                          color: textColor,
                          decoration: todo.completed
                              ? TextDecoration.lineThrough
                              : null),
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
      ),
    );
  }
}
