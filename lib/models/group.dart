// // class Group {
// //   final String id;
// //   final String name;
// //   final List<String> taskIds;
// //   final List<String> members;

// //   Group({
// //     required this.id,
// //     required this.name,
// //     required this.taskIds,
// //     required this.members,
// //   });

// //   factory Group.fromJson(Map<String, dynamic> json) {
// //     var tasksJson = json['tasks'] as List<dynamic>? ?? [];
// //     List<String> taskIdsList = tasksJson.map((taskJson) => taskJson['_id'] as String).toList();

// //     var membersJson = json['members'] as List<dynamic>? ?? [];
// //     List<String> membersList = membersJson.map((member) => member as String).toList();

// //     return Group(
// //       id: json['_id'] as String,
// //       name: json['name'] as String,
// //       taskIds: taskIdsList,
// //       members: membersList,
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       '_id': id,
// //       'name': name,
// //       'tasks': taskIds.map((taskId) => {'_id': taskId}).toList(),
// //       'members': members,
// //     };
// //   }
// // }
// class Group {
//   final String id;
//   final String name;
//   final List<String> taskIds;
//   final List<String> members;

//   Group({
//     required this.id,
//     required this.name,
//     required this.taskIds,
//     required this.members,
//   });

//   factory Group.fromJson(Map<String, dynamic> json) {
//     // Ensure tasks and members are parsed correctly
//     var tasksJson = json['tasks'] as List<dynamic>? ?? [];
//     List<String> taskIdsList = tasksJson.map((taskJson) {
//       // Assuming taskJson is nested JSON with '_id' field
//       if (taskJson is Map<String, dynamic>) {
//         return taskJson['_id']
//             as String; // Adjust according to your JSON structure
//       } else {
//         return taskJson.toString(); // Handle non-Map case if necessary
//       }
//     }).toList();

//     var membersJson = json['members'] as List<dynamic>? ?? [];
//     List<String> membersList = membersJson.map((member) {
//       // Assuming member is a String, adjust if it's nested JSON
//       if (member is String) {
//         return member;
//       } else {
//         return member.toString(); 
//       }
//     }).toList();

//     return Group(
//       id: json['_id'] as String,
//       name: json['name'] as String,
//       taskIds: taskIdsList,
//       members: membersList,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'tasks': taskIds.map((taskId) => {'_id': taskId}).toList(),
//       'members': members.map((member) => member.toJson()).toList(),
//     };
//   }
// }
class Group {
  final String id;
  final String name;
  final List<String> taskIds;
  final List<String> memberIds; // Adjusted to store member IDs

  Group({
    required this.id,
    required this.name,
    required this.taskIds,
    required this.memberIds, // Updated to memberIds
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    // Ensure tasks and members are parsed correctly
    var tasksJson = json['tasks'] as List<dynamic>? ?? [];
    List<String> taskIdsList = tasksJson.map((taskJson) {
      if (taskJson is Map<String, dynamic>) {
        return taskJson['_id'] as String; // Assuming '_id' is String
      } else {
        return taskJson.toString();
      }
    }).toList();

    var membersJson = json['members'] as List<dynamic>? ?? [];
    List<String> memberIdsList = membersJson.map((memberJson) {
      if (memberJson is Map<String, dynamic>) {
        return memberJson['_id'] as String; // Assuming '_id' is String
      } else {
        return memberJson.toString();
      }
    }).toList();

    return Group(
      id: json['_id'] as String,
      name: json['name'] as String,
      taskIds: taskIdsList,
      memberIds: memberIdsList, // Updated to memberIdsList
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'tasks': taskIds.map((taskId) => {'_id': taskId}).toList(),
      'members': memberIds.map((memberId) => {'_id': memberId}).toList(),
    };
  }
}
