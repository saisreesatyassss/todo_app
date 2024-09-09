// // import 'package:flutter/material.dart';
// // import '../services/api_service.dart';
// // import '../models/group.dart';

// // class GroupTasksScreen extends StatelessWidget {
// //   final String groupId;

// //   GroupTasksScreen({required this.groupId});

// //   @override
// //   Widget build(BuildContext context) {
// //     ApiService apiService = ApiService();

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Group Taskss'),
// //       ),
// //       body: FutureBuilder<Group>(
// //         future: apiService.getGroupTasks(groupId),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             print('Snapshot Error: ${snapshot.error}'); // Debugging output

// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData) {
// //             Group group = snapshot.data!;
// //             print('Group Data: ${group.toJson()}'); // Debugging output

// //             return ListView(
// //               children: group.tasks
// //                   .map((task) => ListTile(title: Text(task.name)))
// //                   .toList(),
// //             );
// //           } else {
// //             return const Center(child: Text('No tasks found'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import '../models/task_model.dart';
// import '../services/api_service.dart';

// class GroupTasksScreen extends StatelessWidget {
//   final String groupId;

//   GroupTasksScreen({required this.groupId});

//   @override
//   Widget build(BuildContext context) {
//     ApiService apiService = ApiService();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Group Tasks'),
//       ),
//       body: FutureBuilder<List<Task>>(
//         future: apiService.getGroupTasks(groupId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             print('Snapshot Error: ${snapshot.error}'); // Debugging output
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             List<Task> tasks = snapshot.data!;
//             print('Tasks Data: $tasks'); // Debugging output
//             return ListView(
//               children: tasks
//                   .map((task) => ListTile(title: Text(task.task)))
//                   .toList(),
//             );
//           } else {
//             return const Center(child: Text('No tasks found'));
//           }
//         },
//       ),
//     );
//   }
// }
