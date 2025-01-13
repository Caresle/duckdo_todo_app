import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosService {
  static Future<List<TodoEntity>> getAll() async {
    try {
      final response = await Supabase.instance.client.from('todos').select();
      final List<TodoEntity> todos =
          response.map((todo) => TodoEntity.fromJSON(todo)).toList();
      return todos;
    } catch (e) {
      return [];
    }
  }

  static Future<TodoEntity> create(TodoEntity todo) async {
    try {
      final data = todo.toJSON();
      await Supabase.instance.client.from("todos").insert(data);
      return todo;
    } catch (e) {
      return todo;
    }
  }
}
