import 'package:duckdo_todo/entities/todo_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosService {
  static Future<List<TodoEntity>> getAll() async {
    try {
      final response =
          await Supabase.instance.client.from('todos').select().order('id');
      final List<TodoEntity> todos =
          response.map((todo) => TodoEntity.fromJSON(todo)).toList();
      return todos;
    } catch (e) {
      return [];
    }
  }

  static Future<TodoEntity> create(TodoEntity todo) async {
    try {
      await Supabase.instance.client
          .from("todos")
          .insert({"name": todo.task, "completed": 0});
      return todo;
    } catch (e) {
      print(e.toString());
      return todo;
    }
  }

  static Future<TodoEntity> update(TodoEntity todo) async {
    try {
      final data = todo.toJSON();
      await Supabase.instance.client
          .from(
            "todos",
          )
          .update(data)
          .eq('id', todo.id);
      return todo;
    } catch (e) {
      print(e.toString());
      return todo;
    }
  }

  static Future<void> delete(TodoEntity todo) async {
    try {
      await Supabase.instance.client.from("todos").delete().eq('id', todo.id);
    } catch (e) {
      print(e.toString());
    }
  }
}
