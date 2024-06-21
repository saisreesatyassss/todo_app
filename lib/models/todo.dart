class Todo {
  String id;
  String task;
  bool completed;

  Todo({required this.id, required this.task, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      task: json['task'],
      completed: json['completed'],
    );
  }
}
