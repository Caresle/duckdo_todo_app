import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:duckdo_todo/services/todos_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoEntity> _todos = [];
  bool _isLoading = false;

  List<TodoEntity> get todos => _todos;
  bool get isLoading => _isLoading;

  Future<void> getAll() async {
    _isLoading = true;
    final list = await TodosService.getAll();
    _todos = list;
    _isLoading = false;
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
