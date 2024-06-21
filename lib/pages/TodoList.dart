// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../models/task_model.dart';

// class TodoListPage extends StatefulWidget {
//   @override
//   _TodoListPageState createState() => _TodoListPageState();
// }

// class _TodoListPageState extends State<TodoListPage> {
//   List<Task> _todos = [];
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchTodos();
//   }

//   Future<void> _fetchTodos() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final Uri url = Uri.parse(
//         'http://192.168.1.7:3000/todos'); // Replace with your server URL

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final List<dynamic> todoList = json.decode(response.body);
//         setState(() {
//           _todos = todoList.map((json) => Task.fromJson(json)).toList();
//         });
//       } else {
//         print('Failed to load todos. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching todos: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _toggleTodoCompletion(Task task) async {
//     final Uri url = Uri.parse(
//         'http://192.168.1.7:3000/todos/${task.id}'); // Replace with your server URL

//     try {
//       final response = await http.put(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'completed': !task.completed}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           task.completed = !task.completed;
//         });
//       } else {
//         print('Failed to update todo. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error updating todo: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todos'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _todos.length,
//               itemBuilder: (context, index) {
//                 final task = _todos[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text(
//                       task.task,
//                       style: TextStyle(
//                         decoration: task.completed
//                             ? TextDecoration.lineThrough
//                             : TextDecoration.none,
//                       ),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Created at: ${task.createdAt.toLocal()}'),
//                         if (task.location != null)
//                           Text(
//                               'Location: ${task.location!.latitude}, ${task.location!.longitude}'),
//                       ],
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(
//                         task.completed
//                             ? Icons.check_box
//                             : Icons.check_box_outline_blank,
//                         color: task.completed ? Colors.green : Colors.grey,
//                       ),
//                       onPressed: () => _toggleTodoCompletion(task),
//                     ),
//                   ),
//                   color: task.completed ? Colors.lightGreenAccent : null,
//                 );
//               },
//             ),
//     );
//   }
// }
