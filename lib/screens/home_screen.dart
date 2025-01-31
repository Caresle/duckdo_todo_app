import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DuckDo Todo'),
        backgroundColor: Color.fromRGBO(226, 232, 240, 1),
      ),
      backgroundColor: Color.fromRGBO(226, 232, 240, 1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: TodoList(),
      )),
      floatingActionButton: AddTodo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(selectedItem: 0),
    );
  }
}
