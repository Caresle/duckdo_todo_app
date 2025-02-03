import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetTodo extends StatelessWidget {
  final TodoEntity todo;
  const BottomSheetTodo({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isDark = context.read<ThemeProvider>().isDark;
    final backgroundColor =
        !todo.completed ? AppTheme.secondary(isDark) : AppTheme.primary(isDark);
    final textColor =
        !todo.completed ? AppTheme.primary(isDark) : AppTheme.secondary(isDark);

    return Container(
      height: size.height * .75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: backgroundColor,
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
                  ),
                  Text('Notes', style: TextStyle(color: textColor)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: _TextArea(),
                      )),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppTheme.primary(isDark)),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save_rounded),
                        const SizedBox(width: 4),
                        Text(
                          'Save',
                          style: TextStyle(color: AppTheme.secondary(isDark)),
                        ),
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

  InputDecoration getDecoration(bool isDark) => InputDecoration(
      filled: true,
      focusedBorder: getBorder(AppTheme.primary(isDark)),
      enabledBorder: getBorder(AppTheme.complement(isDark)),
      fillColor: AppTheme.complement(isDark),
      focusColor: AppTheme.complement(isDark),
      border: getBorder(AppTheme.complement(isDark)),
      hintText: "Enter description",
      labelStyle: TextStyle(color: AppTheme.secondary(isDark)));
  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;
    return TextField(
      style: TextStyle(color: AppTheme.secondary(isDark)),
      maxLines: null,
      expands: true,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      decoration: getDecoration(isDark),
    );
  }
}
