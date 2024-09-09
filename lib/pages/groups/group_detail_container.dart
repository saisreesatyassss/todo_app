// import 'dart:math';
// import 'package:flutter/material.dart';
// import '../../../models/task_model.dart';
// import '../../../utils/constants.dart';
// import '../../../utils/utils.dart';
// import '../../models/group.dart';
// import 'GroupTitle.dart';

// class GroupDetailContainer extends StatelessWidget {
//   final int ind;
//   final Group task;

//   const GroupDetailContainer({
//     Key? key,
//     required this.ind,
//     required this.task,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: UniqueKey(),
//       confirmDismiss: (direction) async {
//         return await Utils.showWarningDialog(
//           context,
//           'Remove Group',
//           'Are you sure you want to remove this task?',
//           'Confirm',
//           () {},
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: lightAccentBlue.withOpacity(.5),
//               offset: const Offset(0, 5),
//               blurRadius: 10,
//             ),
//           ],
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           children: [
//             Image.asset(
//               Utils.images['1']!,
//               height: 100,
//               width: 100,
//             ),
//             const Spacer(
//               flex: 1,
//             ),
//             GroupTitle(
//               title: task.name,
//               randomColor1: Random().nextInt(9),
//               randomColor2: Random().nextInt(9),
//             ),
//             const Spacer(
//               flex: 2,
//             ),
//             StatusWidget(),
//             Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: PopupMenuButton(
//                   onSelected: (value) => _handleMenuSelection(
//                     value,
//                     ind,
//                     // Pass your unique key here if needed
//                     'unique_key', // Replace with your unique key
//                     context,
//                   ),
//                   surfaceTintColor: Colors.white,
//                   padding: EdgeInsets.zero,
//                   icon: const Icon(
//                     Icons.more_vert_rounded,
//                     color: Colors.grey,
//                     size: 24,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   itemBuilder: (context) {
//                     return [
//                       const PopupMenuItem(
//                         height: 25,
//                         value: 1,
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.edit_note,
//                               color: Colors.orange,
//                               size: 14,
//                             ),
//                             SizedBox(
//                               width: defaultPadding / 2,
//                             ),
//                             Text('Edit'),
//                           ],
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         height: 25,
//                         value: 2,
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.delete_outline,
//                               color: Colors.orange,
//                               size: 14,
//                             ),
//                             SizedBox(
//                               width: defaultPadding / 2,
//                             ),
//                             Text('Delete'),
//                           ],
//                         ),
//                       ),
//                       const PopupMenuItem(
//                         height: 25,
//                         value: 3,
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.done_all_outlined,
//                               color: Colors.orange,
//                               size: 14,
//                             ),
//                             SizedBox(
//                               width: defaultPadding / 2,
//                             ),
//                             Text('Complete'),
//                           ],
//                         ),
//                       ),
//                     ];
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleMenuSelection(
//     int value,
//     int ind,
//     String key,
//     BuildContext context,
//   ) {
//     // Implement your logic for handling menu item selection
//     switch (value) {
//       case 1:
//         // Handle Edit
//         break;
//       case 2:
//         // Handle Delete
//         break;
//       case 3:
//         // Handle Complete
//         break;
//     }
//   }
// }

// class StatusWidget extends StatelessWidget {
//   const StatusWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool taskCompleted = true; // Replace with actual logic
//     return taskCompleted
//         ? Container(
//             height: 40,
//             width: 40,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   lightOrange,
//                   darkOrange,
//                 ],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: lightOrange,
//                   offset: Offset(0, 10),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.done,
//               color: Colors.white,
//             ),
//           )
//         : Container(); // Replace with appropriate widget or null if not needed
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../models/task_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../models/group.dart';
import 'GroupDetailPage.dart';
import 'GroupTitle.dart';

class GroupDetailContainer extends StatelessWidget {
  final int ind;
  final Group group;

  const GroupDetailContainer({
    Key? key,
    required this.ind,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        return await Utils.showWarningDialog(
          context,
          'Remove Group',
          'Are you sure you want to remove this task?',
          'Confirm',
          () {},
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupDetailPage(group: group),
            ),
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
                Utils.images['1']!,
                height: 100,
                width: 100,
              ),
              const Spacer(
                flex: 1,
              ),
              GroupTitle(
                title: group.name,
                randomColor1: Random().nextInt(9),
                randomColor2: Random().nextInt(9),
              ),
              const Spacer(
                flex: 2,
              ),
              StatusWidget(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PopupMenuButton(
                    onSelected: (value) => _handleMenuSelection(
                      value,
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
      ),
    );
  }

  void _handleMenuSelection(
    int value,
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
    bool taskCompleted = true; // Replace with actual logic
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
