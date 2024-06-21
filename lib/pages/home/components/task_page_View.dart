import 'package:flutter/material.dart';

import 'task_list.dart';

class TaskPageView extends StatelessWidget {
  TaskPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      // controller: controller.pageController,
      children: const [
        TaskList(
          index: 0,
        ),
        TaskList(
          index: 1,
        ),
        TaskList(
          index: 2,
        ),
        TaskList(
          index: 3,
        ),
        TaskList(
          index: 4,
        ),
        TaskList(
          index: 5,
        ),
        TaskList(
          index: 6,
        ),
      ],
    );
  }
}
