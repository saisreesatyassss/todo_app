// // // import 'dart:math';

// // // import 'package:flutter/material.dart';

// // // import '../../../utils/constants.dart';
// // // import '../../../utils/utils.dart';

// // // class TaskTitle extends StatelessWidget {
// // //   TaskTitle({super.key, required this.index, required this.ind});
// // //   final int index;
// // //   final int ind;
// // //   final int randomColor1 = Random().nextInt(9);
// // //   final int randomColor2 = Random().nextInt(9);
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       crossAxisAlignment: CrossAxisAlignment.center,
// // //       children: [
// // //         Text(
// // //           "controller.list[ind][index].title",
// // //           style: const TextStyle(
// // //               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
// // //         ),
// // //         Text(
// // //           "description" ,
// // //           style: const TextStyle(
// // //               color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 12),
// // //         ),
// // //         const SizedBox(
// // //           height: defaultPadding / 2,
// // //         ),
// // //         Row(
// // //           children: [
// // //             Container(
// // //               alignment: Alignment.center,
// // //               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
// // //               decoration: BoxDecoration(
// // //                 color: Utils.colors[randomColor1].withOpacity(.5),
// // //                 borderRadius: BorderRadius.circular(10),
// // //               ),
// // //               child: Text(
// // //                 Utils.tags[Random().nextInt(13)],
// // //                 style: TextStyle(color: Utils.colors[randomColor1]),
// // //               ),
// // //             ),
// // //             const SizedBox(
// // //               width: defaultPadding / 2,
// // //             ),
// // //             Container(
// // //               alignment: Alignment.center,
// // //               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
// // //               decoration: BoxDecoration(
// // //                   color: Utils.colors[randomColor2].withOpacity(.5),
// // //                   borderRadius: BorderRadius.circular(10)),
// // //               child: Text(
// // //                 Utils.tags[Random().nextInt(13)],
// // //                 style: TextStyle(color: Utils.colors[randomColor2]),
// // //               ),
// // //             )
// // //           ],
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'dart:math';

// // import 'package:flutter/material.dart';
// // import '../../../utils/constants.dart';
// // import '../../../utils/utils.dart';

// // class TaskTitle extends StatelessWidget {
// //   final String title;
// //   final String description;
// //   final String category;
// //   final int randomColor1;
// //   final int randomColor2;

// //   const TaskTitle({
// //     Key? key,
// //     required this.title,
// //     required this.description,
// //     required this.category,
// //     required this.randomColor1,
// //     required this.randomColor2,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: [
// //         Text(
// //           title, // Display task title dynamically
// //           style: const TextStyle(
// //             color: Colors.black,
// //             fontWeight: FontWeight.bold,
// //             fontSize: 20,
// //           ),
// //         ),
// //         Text(
// //           '$description - $category', // Display task start and end time
// //           style: const TextStyle(
// //             color: Colors.grey,
// //             fontWeight: FontWeight.w300,
// //             fontSize: 12,
// //           ),
// //         ),
// //         const SizedBox(
// //           height: defaultPadding / 2,
// //         ),
// //         Row(
// //           children: [
// //             Container(
// //               alignment: Alignment.center,
// //               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
// //               decoration: BoxDecoration(
// //                 color: Utils.colors[randomColor1].withOpacity(.5),
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Text(
// //                 Utils.tags[Random().nextInt(13)], // Random tag for demo
// //                 style: TextStyle(color: Utils.colors[randomColor1]),
// //               ),
// //             ),
// //             const SizedBox(
// //               width: defaultPadding / 2,
// //             ),
// //             Container(
// //               alignment: Alignment.center,
// //               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
// //               decoration: BoxDecoration(
// //                 color: Utils.colors[randomColor2].withOpacity(.5),
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Text(
// //                 Utils.tags[Random().nextInt(13)], // Random tag for demo
// //                 style: TextStyle(color: Utils.colors[randomColor2]),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'dart:math';

// import 'package:flutter/material.dart';
// import '../../../utils/constants.dart';
// import '../../../utils/utils.dart';

// class TaskTitle extends StatelessWidget {
//   final String title;
//   final String? description;
//   final String? category;
//   final DateTime createdAt;
//   final int randomColor1;
//   final int randomColor2;

//   const TaskTitle({
//     Key? key,
//     required this.title,
//     this.description,
//     this.category,
//     required this.createdAt,
//     required this.randomColor1,
//     required this.randomColor2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           title, // Display task title dynamically
//           style: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         Text(
//           '$description ',
//           style: const TextStyle(
//             color: Colors.grey,
//             fontWeight: FontWeight.w300,
//             fontSize: 12,
//           ),
//         ),
//         const SizedBox(
//           height: defaultPadding / 2,
//         ),
//         Row(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Utils.colors[randomColor1].withOpacity(.5),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 '$category',
//                 style: TextStyle(color: Utils.colors[randomColor1]),
//               ),
//             ),
//             const SizedBox(
//               width: defaultPadding / 2,
//             ),
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Utils.colors[randomColor2].withOpacity(.5),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 '$createdAt',
//                 style: TextStyle(color: Utils.colors[randomColor2]),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

class TaskTitle extends StatelessWidget {
  final String title;
  final String? description;
  final String? category;
  final DateTime createdAt;
  final int randomColor1;
  final int randomColor2;

  const TaskTitle({
    Key? key,
    required this.title,
    this.description,
    this.category,
    required this.createdAt,
    required this.randomColor1,
    required this.randomColor2,
  }) : super(key: key);

  String formatDate(DateTime dateTime) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title, // Display task title dynamically
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          '$description ',
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                color: Utils.colors[randomColor1].withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$category',
                style: TextStyle(color: Utils.colors[randomColor1]),
              ),
            ),
            const SizedBox(
              width: defaultPadding * 3,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                color: Utils.colors[randomColor2].withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                formatDate(createdAt),
                style: TextStyle(color: Utils.colors[randomColor2]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
