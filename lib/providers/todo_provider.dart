import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:duckdo_todo/services/todos_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoEntity> _todos = [];

  List<TodoEntity> get todos => _todos;

  Future<void> getAll() async {
    final list = await TodosService.getAll();
    _todos = list;
    notifyListeners();
  }

  Future<void> create(TodoEntity todo) async {
    await TodosService.create(todo);
    getAll();
  }

  Future<void> update(TodoEntity todo) async {
    await TodosService.update(todo);
    getAll();
  }

  Future<void> delete(TodoEntity todo) async {
    await TodosService.delete(todo);
    getAll();
  }
}
