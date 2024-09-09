// class Task {
//   final String id;
//   final String task;
//   late final bool completed;
//   final DateTime createdAt;
//   final String user;
//   final Location location;

//   Task({
//     required this.id,
//     required this.task,
//     required this.completed,
//     required this.createdAt,
//     required this.user,
//     required this.location,
//   });

//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       id: json['_id'] as String,
//       task: json['task'] as String,
//       completed: json['completed'] as bool,
//       createdAt: DateTime.parse(json['created_at'] as String),
//       user: json['user'] as String,
//       location: Location.fromJson(json['location'] as Map<String, dynamic>),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'task': task,
//       'completed': completed,
//       'created_at': createdAt.toIso8601String(),
//       'user': user,
//       'location': location.toJson(),
//     };
//   }
// }

// class Location {
//   final double latitude;
//   final double longitude;

//   Location({required this.latitude, required this.longitude});

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       latitude: json['latitude'] as double,
//       longitude: json['longitude'] as double,
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
  final String? id;
  final String task;
  late final bool completed;
  final DateTime createdAt;
  final String? user;
  final Location location;

  // Additional optional fields
  final String? label;
  final String? category;
  final String? description;
  final bool? isLowPriority;
  final String? selectedDate;
  final String? startTime;
  final String? endTime;
  final int? selectedImageIndex;

  Task({
    this.id,
    required this.task,
    required this.completed,
    required this.createdAt,
    this.user,
    required this.location,
    this.label,
    this.category,
    this.description,
    this.isLowPriority,
    this.selectedDate,
    this.startTime,
    this.endTime,
    this.selectedImageIndex,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'] as String,
      completed: json['completed'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      user: json['user'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      label: json['label'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      isLowPriority: json['isLowPriority'] as bool?,
      selectedDate: json['selectedDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      selectedImageIndex: json['selectedImageIndex'] as int?,
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
      'label': label,
      'category': category,
      'description': description,
      'isLowPriority': isLowPriority,
      'selectedDate': selectedDate,
      'startTime': startTime,
      'endTime': endTime,
      'selectedImageIndex': selectedImageIndex,
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
