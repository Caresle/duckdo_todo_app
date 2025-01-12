import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosService {
  Future<List<TodoEntity>> getAll() async {
    try {
      final response = await Supabase.instance.client.from('todos').select();
      final List<TodoEntity> todos =
          response.map((todo) => TodoEntity.fromJSON(todo)).toList();
      return todos;
    } catch (e) {
      return [];
    }
  }

  Future<TodoEntity> create(TodoEntity todo) async {
    try {
      await Supabase.instance.client.from("todos").insert({
        'name': todo.task,
        'completed': todo.completed,
      });
      return todo;
    } catch (e) {
      return todo;
    }
  }
}
