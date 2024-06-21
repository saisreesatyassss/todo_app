import 'package:flutter/material.dart';
import 'components/back_decoration.dart';
import 'components/bottom_nav_bar.dart';
import 'components/floating_action.dart';
import 'components/task_page_holder.dart';
import 'components/upper_body.dart';

class first extends StatelessWidget {
  first({super.key});
  // final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const BackColors(),
          SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UperBody(),
                    const Expanded(
                      child: TaskPageBody(),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
