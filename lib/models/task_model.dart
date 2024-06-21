
// class Task {
//   String id;
//   String task;
//   bool completed;
//   DateTime createdAt;
//   Location? location;

//   Task({
//     required this.id,
//     required this.task,
//     required this.completed,
//     required this.createdAt,
//     this.location,
//   });

//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       id: json['_id'],
//       task: json['task'],
//       completed: json['completed'],
//       createdAt: DateTime.parse(json['created_at']),
//       location: json['location'] != null
//           ? Location.fromJson(json['location'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'task': task,
//       'completed': completed,
//       'created_at': createdAt.toIso8601String(),
//       'location': location?.toJson(),
//     };
//   }
// }

// class Location {
//   double latitude;
//   double longitude;

//   Location({required this.latitude, required this.longitude});

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       latitude: json['latitude'],
//       longitude: json['longitude'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }
// }
class Task {
  final String id;
  final String task;
  late final bool completed;
  final DateTime createdAt;
  final String user;
  final Location location;

  Task({
    required this.id,
    required this.task,
    required this.completed,
    required this.createdAt,
    required this.user,
    required this.location,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'] as String,
      task: json['task'] as String,
      completed: json['completed'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      user: json['user'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'task': task,
      'completed': completed,
      'created_at': createdAt.toIso8601String(),
      'user': user,
      'location': location.toJson(),
    };
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
