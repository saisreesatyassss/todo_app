import 'package:flutter/material.dart'; 
import '../../../models/task_model.dart';
import '../../../services/api_service.dart';
import '../../../services/responsive.dart';
import 'task_detail_container.dart'; // Import your ApiService

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: ApiService().getUserTodos(), // Call getUserTodos to fetch tasks
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No tasks found'));
        } else {
          List<Task> tasks = snapshot.data!;

          return Responsive(
            tablet: Grid(
              crossAsis: 2,
              ratio: 3,
              tasks: tasks,
              ind: index,
            ),
            largeTablet: Grid(
              crossAsis: 3,
              ratio: 3,
              tasks: tasks,
              ind: index,
            ),
            mobile: Grid(
              ratio: 3,
              crossAsis: 1,
              tasks: tasks,
              ind: index,
            ),
          );
        }
      },
    );
  }
}

class Grid extends StatelessWidget {
  final int crossAsis;
  final double ratio;
  final int ind;
  final List<Task> tasks;

  Grid({
    Key? key,
    required this.crossAsis,
    required this.ratio,
    required this.tasks,
    required this.ind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> taskList = tasks;

    return taskList.isEmpty
        ? const Center(
            child: Text(
              'No Task Today',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.only(top: 40),
            itemCount: taskList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAsis,
              childAspectRatio: ratio,
            ),
            itemBuilder: (context, index) {
              Task task = taskList[index]; // Get task at the current index
              return TaskDetailContainer(
                ind: ind,
                task: task, // Pass the task object to TaskDetailContainer
              );
            },
          );
  }
}
