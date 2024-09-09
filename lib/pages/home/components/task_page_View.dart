import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/components/task_list.dart';

class TaskPageView extends StatelessWidget {
  TaskPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      // controller: controller.pageController,
      children: const [
        TaskList(
          index: 1,
        ),
      ],
    );
  }
}
