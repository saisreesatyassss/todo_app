// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';

// // // import '../models/task_model.dart';

// // // class TaskForm extends StatefulWidget {
// // //   @override
// // //   _TaskFormState createState() => _TaskFormState();
// // // }

// // // class _TaskFormState extends State<TaskForm> {
// // //   final TextEditingController _taskController = TextEditingController();
// // //   bool _isLoading = false;

// // //   Future<void> _createTask(Task task) async {
// // //     setState(() {
// // //       _isLoading = true;
// // //     });

// // //     final Uri url = Uri.parse(
// // //         'http://192.168.1.7:3000/todos'); // Replace with your server URL

// // //     try {
// // //       final response = await http.post(
// // //         url,
// // //         headers: {'Content-Type': 'application/json'},
// // //         body: json.encode(task.toJson()),
// // //       );

// // //       if (response.statusCode == 201) {
// // //         // Task created successfully
// // //         print('Task created successfully');
// // //       } else {
// // //         // Handle other status codes
// // //         print('Failed to create task. Status Code: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       // Handle network or server errors
// // //       print('Error creating task: $e');
// // //     } finally {
// // //       setState(() {
// // //         _isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Create New Task'),
// // //       ),
// // //       body: _isLoading
// // //           ? Center(child: CircularProgressIndicator())
// // //           : Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                 children: [
// // //                   TextField(
// // //                     controller: _taskController,
// // //                     decoration: InputDecoration(labelText: 'Task'),
// // //                   ),
// // //                   SizedBox(height: 16.0),
// // //                   ElevatedButton(
// // //                     onPressed: () {
// // //                       final task = Task(
// // //                         task: _taskController.text.trim(),
// // //                       );
// // //                       _createTask(task);
// // //                     },
// // //                     child: Text('Create Task'),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //     );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _taskController.dispose();
// // //     super.dispose();
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // import '../models/task_model.dart';

// // class TaskForm extends StatefulWidget {
// //   @override
// //   _TaskFormState createState() => _TaskFormState();
// // }

// // class _TaskFormState extends State<TaskForm> {
// //   final TextEditingController _taskController = TextEditingController();
// //   bool _isLoading = false;

// //   Future<void> _createTask(Task task) async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     final Uri url = Uri.parse('http://192.168.1.7:3000/todos'); // Replace with your server URL

// //     try {
// //       final response = await http.post(
// //         url,
// //         headers: {'Content-Type': 'application/json'},
// //         body: json.encode(task.toJson()),
// //       );

// //       if (response.statusCode == 201) {
// //         // Task created successfully
// //         print('Task created successfully');
// //       } else {
// //         // Handle other status codes
// //         print('Failed to create task. Status Code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       // Handle network or server errors
// //       print('Error creating task: $e');
// //     } finally {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   Future<Location?> _getCurrentLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;

// //     // Test if location services are enabled.
// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       return null;
// //     }

// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         return null;
// //       }
// //     }

// //     if (permission == LocationPermission.deniedForever) {
// //       return null;
// //     }

// //     Position position = await Geolocator.getCurrentPosition();
// //     return Location(latitude: position.latitude, longitude: position.longitude);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Create New Task'),
// //       ),
// //       body: _isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// //                 children: [
// //                   TextField(
// //                     controller: _taskController,
// //                     decoration: InputDecoration(labelText: 'Task'),
// //                   ),
// //                   SizedBox(height: 16.0),
// //                   ElevatedButton(
// //                     onPressed: () async {
// //                       Location? location = await _getCurrentLocation();
// //                       final task = Task(
// //                         task: _taskController.text.trim(),
// //                         location: location,
// //                       );
// //                       _createTask(task);
// //                     },
// //                     child: Text('Create Task'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _taskController.dispose();
// //     super.dispose();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../models/task_model.dart';

// class TaskForm extends StatefulWidget {
//   @override
//   _TaskFormState createState() => _TaskFormState();
// }

// class _TaskFormState extends State<TaskForm> {
//   final TextEditingController _taskController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _createTask(Task task) async {
//     setState(() {
//       _isLoading = true;
//     });

//     final Uri url = Uri.parse(
//         'http://192.168.1.7:3000/todos'); // Replace with your server URL

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(task.toJson()),
//       );

//       if (response.statusCode == 201) {
//         print('Task created successfully');
//       } else {
//         print('Failed to create task. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error creating task: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<Location?> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return null;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return null;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return null;
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     return Location(latitude: position.latitude, longitude: position.longitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create New Task'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.list),
//             onPressed: () {
//               Navigator.pushNamed(context, '/todos');
//             },
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextField(
//                     controller: _taskController,
//                     decoration: InputDecoration(labelText: 'Task'),
//                   ),
//                   SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () async {
//                       Location? location = await _getCurrentLocation();
//                       final task = Task(
//                         id: '',
//                         task: _taskController.text.trim(),
//                         completed: false,
//                         createdAt: DateTime.now(),
//                           user: '', location: null,
//                       );
//                       _createTask(task);
//                     },
//                     child: Text('Create Task'),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     _taskController.dispose();
//     super.dispose();
//   }
// }
