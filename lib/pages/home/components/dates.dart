// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../../utils/utils.dart';

// class Dates extends StatelessWidget {
//   final DateTime date;

//   const Dates({Key? key, required this.date}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           Utils.getMonth(date),
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 13,
//           ),
//         ),
//         Text(
//           Utils.getDate(date),
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 26,
//           ),
//         ),
//         Text(
//           Utils.getDay(date),
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 13,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/utils.dart';

class Dates extends StatelessWidget {
  final DateTime date;

  const Dates({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Utils.getMonth(date),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        Text(
          Utils.getDate(date),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        Text(
          Utils.getDay(date),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
