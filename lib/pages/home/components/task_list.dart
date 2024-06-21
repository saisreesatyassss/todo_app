import 'package:flutter/material.dart'; 
import 'package:todo_app/pages/home/components/task_detail_container.dart';
import '../../../services/responsive.dart';

// Dummy Task class for demonstration
class Task {
  final String title;
  final String status;

  Task({required this.title, required this.status});
}

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    // Simulated custom data for taskLists
    List<List<Task>> taskLists = [
      // Example list of tasks for index 0
      [
        Task(title: 'Task 1', status: 'incomplete'),
        Task(title: 'Task 2', status: 'complete'),
        Task(title: 'Task 3', status: 'incomplete'),
      ],
      // Example list of tasks for index 1
      [
        Task(title: 'Task A', status: 'incomplete'),
        Task(title: 'Task B', status: 'incomplete'),
        Task(title: 'Task C', status: 'complete'),
        Task(title: 'Task D', status: 'incomplete'),
      ],
      // Add more lists as needed for different indices
    ];

    return Responsive(
      tablet: Grid(
        crossAsis: 2,
        ratio: 3,
        tasks: taskLists,
        ind: index,
      ),
      largeTablet: Grid(
        crossAsis: 3,
        ratio: 3,
        tasks: taskLists,
        ind: index,
      ),
      mobile: Grid(
        ratio: 3,
        crossAsis: 1,
        tasks: taskLists,
        ind: index,
      ),
    );
  }
}

class Grid extends StatelessWidget {
  final int crossAsis;
  final double ratio;
  final int ind;
  final List<List<Task>> tasks; // List of lists of tasks

  Grid({
    Key? key,
    required this.crossAsis,
    required this.ratio,
    required this.tasks,
    required this.ind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> taskList = tasks[ind];

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
              return TaskDetailContainer(
                index: index,
                ind: ind,
              );
            },
          );
  }
}
