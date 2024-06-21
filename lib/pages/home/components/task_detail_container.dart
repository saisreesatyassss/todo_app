import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import 'task_detail_col.dart';

class TaskDetailContainer extends StatelessWidget {
  final int index;
  final int ind;

  const TaskDetailContainer({Key? key, required this.index, required this.ind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        return await Utils.showWarningDialog(
          context,
          'Remove Task',
          'Are you sure to remove this task',
          'Confirm',
          () {
            // Handle confirmation logic here
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: lightAccentBlue.withOpacity(.5),
              offset: const Offset(0, 5),
              blurRadius: 10,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Image.asset(
              Utils.images['1']!, // Replace '1' with your actual image key
              height: 100,
              width: 100,
            ),
            const Spacer(
              flex: 1,
            ),
            TaskTitle(index: index, ind: ind),
            const Spacer(
              flex: 2,
            ),
            // Example logic based on task status (replace with your own logic)
            const StatusWidget(), // Example: StatusWidget for displaying task status
            // Replace StatusWidget with your actual widget for task status
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PopupMenuButton(
                  onSelected: (value) => _handleMenuSelection(
                    value,
                    index,
                    ind,
                    // Pass your unique key here if needed
                    'unique_key', // Replace with your unique key
                    context,
                  ),
                  surfaceTintColor: Colors.white,
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey,
                    size: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: const BorderSide.none(),
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        height: 25,
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_note,
                              color: Colors.orange,
                              size: 14,
                            ),
                            SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 25,
                        value: 2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline,
                              color: Colors.orange,
                              size: 14,
                            ),
                            SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Text('Delete'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 25,
                        value: 3,
                        child: Row(
                          children: [
                            Icon(
                              Icons.done_all_outlined,
                              color: Colors.orange,
                              size: 14,
                            ),
                            SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Text('Complete'),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuSelection(
    int value,
    int index,
    int ind,
    String key,
    BuildContext context,
  ) {
    // Implement your logic for handling menu item selection
    switch (value) {
      case 1:
        // Handle Edit
        break;
      case 2:
        // Handle Delete
        break;
      case 3:
        // Handle Complete
        break;
    }
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example logic based on task status (replace with your own logic)
    bool taskCompleted = false; // Replace with actual logic
    return taskCompleted
        ? Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightOrange,
                  darkOrange,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: lightOrange,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.done,
              color: Colors.white,
            ),
          )
        : Container(); // Replace with appropriate widget or null if not needed
  }
}
