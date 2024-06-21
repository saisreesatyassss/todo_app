// class Group {
//   final String id;
//   final String name;
//   final List<Todo> tasks;

//   Group({required this.id, required this.name, required this.tasks});

//   factory Group.fromJson(Map<String, dynamic> json) {
//     var tasksJson = json['tasks'] as List? ?? [];
//     // List<Todo> tasksList =tasksJson.map((taskJson) => Todo.fromJson(taskJson)).toList();
//     List<Todo> tasksList = tasksJson
//         .map((taskJson) => Todo.fromJson(taskJson as Map<String, dynamic>))
//         .toList();

//     return Group(
//       id: json['_id'] ?? '', // Handle null or missing values appropriately
//       name: json['name'] ?? '',
//       tasks: tasksList,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'tasks': tasks.map((task) => task.toJson()).toList(),
//     };
//   }
// }

// class Todo {
//   final String id;
//   final String name;

//   Todo({required this.id, required this.name});

//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//     };
//   }
// }
class Group {
  final String id;
  final String name;
  final List<Todo> tasks;

  Group({required this.id, required this.name, required this.tasks});

  factory Group.fromJson(Map<String, dynamic> json) {
    var tasksJson = json['tasks'] as List<dynamic>? ?? [];
    List<Todo> tasksList = tasksJson
        .map((taskJson) => Todo.fromJson(taskJson as Map<String, dynamic>))
        .toList();

    return Group(
      id: json['_id'] as String? ??
          '', // Handle null or missing values appropriately
      name: json['name'] as String? ?? '',
      tasks: tasksList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }
}

class Todo {
  final String id;
  final String name;

  Todo({required this.id, required this.name});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
