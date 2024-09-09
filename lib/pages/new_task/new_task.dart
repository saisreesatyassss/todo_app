// import 'package:flutter/material.dart';
// import '../../services/responsive.dart';
// import 'components/category_input.dart';
// import 'components/date_time.dart';
// import 'components/description_input.dart';
// import 'components/illustration_list.dart';
// import 'components/lable_input.dart';
// import 'components/task_button.dart';

// class NewTask extends StatefulWidget {
//   NewTask({super.key});

//   @override
//   State<NewTask> createState() => _NewTaskState();
// }

// class _NewTaskState extends State<NewTask> {
//   final TextEditingController _labelController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   String _selectedDate = 'dd/mm/yyyy';
//   String _startTime = 'hh:mm:a';
//   String _endTime = 'hh:mm:a';
//   bool _isLowPriority = true;
//   int _selectedImageIndex = -1; // Track the selected image index

//   @override
//   void dispose() {
//     _labelController.dispose();
//     _categoryController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     String label = _labelController.text;
//     String category = _categoryController.text;
//     String description = _descriptionController.text;
//     bool isLowPriority = _isLowPriority;
//     int selectedImageIndex = _selectedImageIndex;

//     // Send data to the backend
//     print('Label: $label');
//     print('Category: $category');
//     print('Description: $description');
//     print('Date: $_selectedDate');
//     print('Start Time: $_startTime');
//     print('End Time: $_endTime');
//     print('Priority: ${isLowPriority ? 'Low' : 'High'}');
//     print('Selected Image Index: $selectedImageIndex');
//   }

//   void _handlePriorityChange(bool isLow) {
//     setState(() {
//       _isLowPriority = isLow;
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = "${picked.day}/${picked.month}/${picked.year}";
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         String formattedTime = picked.format(context);
//         if (isStartTime) {
//           _startTime = formattedTime;
//         } else {
//           _endTime = formattedTime;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(30),
//         topRight: Radius.circular(30),
//       ),
//       child: Container(
//         height: 650,
//         width: Responsive.isLargeTablet(context)
//             ? MediaQuery.sizeOf(context).width / 2.5
//             : Responsive.isTablet(context)
//                 ? MediaQuery.sizeOf(context).width / 1.6
//                 : MediaQuery.sizeOf(context).width,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // SelectImageList(),
//                           SelectImageList(
//                             onImageSelected: (index) {
//                               setState(() {
//                                 _selectedImageIndex = index;
//                               });
//                             },
//                           ),
//                           LabelInput(
//                             controller: _labelController,
//                             onPriorityChanged: _handlePriorityChange,
//                           ),
//                           CategoryInput(
//                             controller: _categoryController,
//                           ),
//                           DescriptionInput(
//                             controller: _descriptionController,
//                           ),
//                           DateTimeInput(
//                             selectedDate: _selectedDate,
//                             startTime: _startTime,
//                             endTime: _endTime,
//                             onDateTap: () => _selectDate(context),
//                             onStartTimeTap: () => _selectTime(context, true),
//                             onEndTimeTap: () => _selectTime(context, false),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: _submitForm,
//                     child: CreateTaskButton(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import '../../models/task_model.dart';
import '../../services/api_service.dart';
import '../../services/responsive.dart';
import 'components/category_input.dart';
import 'components/date_time.dart';
import 'components/description_input.dart';
import 'components/illustration_list.dart';
import 'components/lable_input.dart';
import 'components/task_button.dart';
import 'package:http/http.dart' as http;

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedDate = 'dd/mm/yyyy';
  String _startTime = 'hh:mm:a';
  String _endTime = 'hh:mm:a';
  bool _isLowPriority = true;
  int _selectedImageIndex = -1; // Track the selected image index
  final ApiService _apiService = ApiService();

  @override
  void dispose() {
    _labelController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    String label = _labelController.text;
    String category = _categoryController.text;
    String description = _descriptionController.text;
    bool isLowPriority = _isLowPriority;
    int selectedImageIndex = _selectedImageIndex;

    // Create a new Task object (assuming you have a Task class defined)
    Task newTask = Task(
      task: label,
      completed: false,
      createdAt: DateTime.now(),
      location: Location(
          latitude: 0.0, longitude: 0.0), // Replace with actual location
      label: label.isNotEmpty ? label : null,
      category: category.isNotEmpty ? category : null,
      description: description.isNotEmpty ? description : null,
      isLowPriority: _isLowPriority,
      selectedDate: _selectedDate != 'dd/mm/yyyy' ? _selectedDate : null,
      startTime: _startTime != 'hh:mm:a' ? _startTime : null,
      endTime: _endTime != 'hh:mm:a' ? _endTime : null,
      selectedImageIndex: _selectedImageIndex != -1 ? _selectedImageIndex : 1,
    );

    // Convert the task to JSON
    Map<String, dynamic> taskJson = newTask.toJson();

    // Get the token
    String? token = await _apiService.getToken();

    if (token == null) {
      print('Failed to get token');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://todo-nodejs-server.onrender.com/todos'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(taskJson),
      );

      if (response.statusCode == 201) {
        print('Task created successfully: ${response.body}');
      } else {
        print('Failed to create task: ${response.body}');
      }
    } catch (e) {
      print('Error creating task: $e');
    }
  }

  void _handlePriorityChange(bool isLow) {
    setState(() {
      _isLowPriority = isLow;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        String formattedTime = picked.format(context);
        if (isStartTime) {
          _startTime = formattedTime;
        } else {
          _endTime = formattedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        height: 650,
        width: Responsive.isLargeTablet(context)
            ? MediaQuery.sizeOf(context).width / 2.5
            : Responsive.isTablet(context)
                ? MediaQuery.sizeOf(context).width / 1.6
                : MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectImageList(
                            onImageSelected: (index) {
                              setState(() {
                                _selectedImageIndex = index;
                              });
                            },
                          ),
                          LabelInput(
                            controller: _labelController,
                            onPriorityChanged: _handlePriorityChange,
                          ),
                          CategoryInput(
                            controller: _categoryController,
                          ),
                          DescriptionInput(
                            controller: _descriptionController,
                          ),
                          DateTimeInput(
                            selectedDate: _selectedDate,
                            startTime: _startTime,
                            endTime: _endTime,
                            onDateTap: () => _selectDate(context),
                            onStartTimeTap: () => _selectTime(context, true),
                            onEndTimeTap: () => _selectTime(context, false),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _submitForm,
                    child: CreateTaskButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
