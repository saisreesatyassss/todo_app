// // import 'package:flutter/material.dart';
// // import '../../models/task_model.dart';
// // import '../../services/api_service.dart';

// // class NearbyTasksPage extends StatefulWidget {
// //   @override
// //   _NearbyTasksPageState createState() => _NearbyTasksPageState();
// // }

// // class _NearbyTasksPageState extends State<NearbyTasksPage> {
// //   final ApiService apiService = ApiService();
// //   List<Task> tasks = [];
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchTasks();
// //   }

// //   Future<void> fetchTasks() async {
// //     try {
// //       List<Task> fetchedTasks = await apiService.getUserTodos();
// //       fetchedTasks.sort((a, b) => a.completed ? 1 : -1); // Sort tasks
// //       setState(() {
// //         tasks = fetchedTasks;
// //         isLoading = false;
// //       });
// //     } catch (e) {
// //       print(e);
// //       setState(() {
// //         isLoading = false;
// //       });
// //     }
// //   }

// //   String getCategoryName(int index) {
// //     const categories = [
// //       "bank",
// //       "finance",
// //       "lodging",
// //       "school",
// //       "university",
// //       "health",
// //       "store",
// //       "restaurant",
// //       "food",
// //       "atm",
// //       "jewelry_store",
// //     ];
// //     // const categories = [
// //     //   "locality",
// //     //   "political",
// //     //   "transit_station",
// //     //   "point_of_interest",
// //     //   "establishment",
// //     //   "bank",
// //     //   "finance",
// //     //   "lodging",
// //     //   "school",
// //     //   "university",
// //     //   "health",
// //     //   "hindu_temple",
// //     //   "place_of_worship",
// //     //   "store",
// //     //   "restaurant",
// //     //   "food",
// //     //   "atm",
// //     //   "jewelry_store",
// //     //   "sublocality_level_1",
// //     //   "sublocality"
// //     // ];
// //     return (index >= 1 && index <= categories.length)
// //         ? categories[index - 1]
// //         : 'Unknown';
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Nearby Tasks'),
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Colors.pink, Colors.blue],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Colors.pink[100]!, Colors.blue[100]!],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: isLoading
// //             ? Center(child: CircularProgressIndicator())
// //             : ListView.builder(
// //                 itemCount: tasks.length,
// //                 itemBuilder: (context, index) {
// //                   Task task = tasks[index];
// //                   return Padding(
// //                     padding: const EdgeInsets.all(10.0),
// //                     child: Card(
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15.0),
// //                       ),
// //                       elevation: 5,
// //                       child: Container(
// //                         decoration: BoxDecoration(
// //                           gradient: LinearGradient(
// //                             colors: task.isLowPriority!
// //                                 ? [Colors.green[100]!, Colors.green[300]!]
// //                                 : [Colors.red[100]!, Colors.red[300]!],
// //                             begin: Alignment.topLeft,
// //                             end: Alignment.bottomRight,
// //                           ),
// //                           borderRadius: BorderRadius.circular(15.0),
// //                         ),
// //                         child: ListTile(
// //                           contentPadding: EdgeInsets.all(15.0),
// //                           title: Text(
// //                             task.task,
// //                             style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                           subtitle: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               SizedBox(height: 5),
// //                               Text(task.description ?? 'No description'),
// //                               SizedBox(height: 5),
// //                               Text(
// //                                 'Created at: ${task.createdAt.toLocal()}',
// //                                 style: TextStyle(
// //                                     fontSize: 12, fontStyle: FontStyle.italic),
// //                               ),
// //                               SizedBox(height: 5),
// //                               Text(
// //                                 'Category: ${getCategoryName(task.selectedImageIndex!)}',
// //                                 style: TextStyle(
// //                                     fontSize: 14, fontWeight: FontWeight.bold),
// //                               ),
// //                             ],
// //                           ),
// //                           trailing: task.completed
// //                               ? Icon(Icons.check_circle, color: Colors.green)
// //                               : Icon(Icons.radio_button_unchecked,
// //                                   color: Colors.red),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:todo_app/pages/maps/mapscreenreq.dart';
// import '../../models/task_model.dart';
// import '../../services/api_service.dart';

// class NearbyTasksPage extends StatefulWidget {
//   @override
//   _NearbyTasksPageState createState() => _NearbyTasksPageState();
// }

// class _NearbyTasksPageState extends State<NearbyTasksPage> {
//   final ApiService apiService = ApiService();
//   List<Task> tasks = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchTasks();
//   }

//   Future<void> fetchTasks() async {
//     try {
//       List<Task> fetchedTasks = await apiService.getUserTodos();
//       fetchedTasks.sort((a, b) => a.completed ? 1 : -1); // Sort tasks
//       setState(() {
//         tasks = fetchedTasks;
//         isLoading = false;
//       });
//     } catch (e) {
//       print(e);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   String getCategoryName(int index) {
//     const categories = [
//       "bank",
//       "finance",
//       "lodging",
//       "school",
//       "university",
//       "health",
//       "store",
//       "restaurant",
//       "food",
//       "atm",
//       "jewelry_store",
//     ];
//     return (index >= 1 && index <= categories.length)
//         ? categories[index - 1]
//         : 'Unknown';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nearby Tasks'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.pink[100]!, Colors.blue[100]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: tasks.length,
//                 itemBuilder: (context, index) {
//                   Task task = tasks[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       elevation: 5,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MapScreenReq(
//                                 type: getCategoryName(task.selectedImageIndex!),
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: task.isLowPriority!
//                                   ? [Colors.green[100]!, Colors.green[300]!]
//                                   : [Colors.red[100]!, Colors.red[300]!],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(15.0),
//                             title: Text(
//                               task.task,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 5),
//                                 Text(task.description ?? 'No description'),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   'Created at: ${task.createdAt.toLocal()}',
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontStyle: FontStyle.italic),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   'Category: ${getCategoryName(task.selectedImageIndex!)}',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                             trailing: task.completed
//                                 ? Icon(Icons.check_circle, color: Colors.green)
//                                 : Icon(Icons.radio_button_unchecked,
//                                     color: Colors.red),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:todo_app/pages/maps/mapscreenreq.dart';
import '../../models/task_model.dart';
import '../../services/api_service.dart';

class NearbyTasksPage extends StatefulWidget {
  @override
  _NearbyTasksPageState createState() => _NearbyTasksPageState();
}

class _NearbyTasksPageState extends State<NearbyTasksPage> {
  final ApiService apiService = ApiService();
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      List<Task> fetchedTasks = await apiService.getUserTodos();
      fetchedTasks.sort((a, b) => a.completed ? 1 : -1); // Sort tasks
      setState(() {
        tasks = fetchedTasks;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  String getCategoryName(int index) {
    const categories = [
      "bank",
      "finance",
      "lodging",
      "school",
      "university",
      "health",
      "store",
      "restaurant",
      "food",
      "atm",
      "jewelry_store",
    ];
    return (index >= 1 && index <= categories.length)
        ? categories[index - 1]
        : 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Tasks'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[100]!, Colors.blue[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  Task task = tasks[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapScreenReq(
                                type: getCategoryName(task.selectedImageIndex!),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: task.isLowPriority!
                                  ? [Colors.green[100]!, Colors.green[300]!]
                                  : [Colors.red[100]!, Colors.red[300]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(15.0),
                            title: Text(
                              task.task,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(task.description ?? 'No description'),
                                SizedBox(height: 5),
                                Text(
                                  'Created at: ${task.createdAt.toLocal()}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Category: ${getCategoryName(task.selectedImageIndex!)}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: task.completed
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : Icon(Icons.radio_button_unchecked,
                                    color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
