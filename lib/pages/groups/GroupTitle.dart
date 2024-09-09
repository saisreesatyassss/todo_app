import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/constants.dart'; 

class GroupTitle extends StatelessWidget {
  final String title;
  final String? description;
  final String? category;
  final DateTime? createdAt;
  final int randomColor1;
  final int randomColor2;

  const GroupTitle({
    Key? key,
    required this.title,
    this.description,
    this.category,
    this.createdAt,
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
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
