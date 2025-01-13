class TodoEntity {
  final int id;
  final String task;
  final bool completed;

  const TodoEntity({
    required this.id,
    required this.task,
    required this.completed,
  });

  factory TodoEntity.fromJSON(Map<String, dynamic> json) => TodoEntity(
      id: json['id'],
      task: json['name'],
      completed: json['completed'] == 1 ? true : false);

  Map<String, dynamic> toJSON() =>
      {"id": id, "name": task, "completed": completed ? 1 : 0};
}
