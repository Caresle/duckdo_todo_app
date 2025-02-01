import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:flutter/material.dart';

class BottomSheetTodo extends StatelessWidget {
  final TodoEntity todo;
  const BottomSheetTodo({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppTheme.secondary,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.task.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Notes'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(height: 200, child: _TextArea()),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppTheme.primary),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save_rounded),
                        const SizedBox(width: 4),
                        Text('Save'),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextArea extends StatelessWidget {
  const _TextArea();
  OutlineInputBorder getBorder(Color color) =>
      OutlineInputBorder(borderSide: BorderSide(color: color));

  InputDecoration getDecoration() => InputDecoration(
        filled: true,
        focusedBorder: getBorder(AppTheme.primary),
        enabledBorder: getBorder(AppTheme.complement),
        fillColor: AppTheme.complement,
        focusColor: AppTheme.complement,
        border: getBorder(AppTheme.complement),
        hintText: "Enter description",
      );
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      expands: true,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      decoration: getDecoration(),
    );
  }
}
