import 'package:flutter/material.dart';
import '../../../utils/constants.dart'; // Adjust the path as per your project structure

class DateTimeContainer extends StatelessWidget {
  const DateTimeContainer({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.date_range,
            color: darkBlue,
            size: 16,
          ),
          SizedBox(width: defaultPadding / 4),
          Text(text),
        ],
      ),
    );
  }
}
