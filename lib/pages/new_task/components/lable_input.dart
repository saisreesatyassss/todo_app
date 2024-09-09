// import 'package:flutter/material.dart';
// import '../../../utils/constants.dart';
// import 'periority_container.dart';
// import 'text_input.dart';

// class LabelInput extends StatelessWidget {
//   const LabelInput({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Label',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: defaultPadding / 2),
//                 TextInputField(
//                   hint: 'Enter Label',
//                   focus: false, // Example: Change to true if you want it focused initially
//                   onTap: () {
//                     // Handle onTap logic here
//                     print('Enter Label');
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: defaultPadding),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Priority',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: defaultPadding / 2),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       // Handle low priority selection
//                       // Example: togglePriority(true);
//                     },
//                     child: const PeriorityContainer(
//                       text: 'Low',
//                       selected: true, // Example: Replace with actual lowPrioritySelected value
//                     ),
//                   ),
//                   const SizedBox(width: defaultPadding / 2),
//                   InkWell(
//                     onTap: () {
//                       // Handle high priority selection
//                       // Example: togglePriority(false);
//                     },
//                     child: const PeriorityContainer(
//                       text: 'High',
//                       selected: false, // Example: Replace with actual lowPrioritySelected value
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'periority_container.dart';
import 'text_input.dart';

class LabelInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<bool> onPriorityChanged;

  const LabelInput({
    Key? key,
    required this.controller,
    required this.onPriorityChanged,
  }) : super(key: key);

  @override
  _LabelInputState createState() => _LabelInputState();
}

class _LabelInputState extends State<LabelInput> {
  bool lowPrioritySelected = true;

  void _togglePriority(bool isLow) {
    setState(() {
      lowPrioritySelected = isLow;
    });
    widget.onPriorityChanged(lowPrioritySelected);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Label',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                TextInputField(
                  controller: widget.controller,
                  hint: 'Enter Label',
                  focus: false,
                  onTap: () {
                    // Handle onTap logic here
                    print('Enter Label');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Priority',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  InkWell(
                    onTap: () => _togglePriority(true),
                    child: PeriorityContainer(
                      text: 'Low',
                      selected: lowPrioritySelected,
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  InkWell(
                    onTap: () => _togglePriority(false),
                    child: PeriorityContainer(
                      text: 'High',
                      selected: !lowPrioritySelected,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
