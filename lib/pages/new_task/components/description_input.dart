import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'text_input.dart';

class DescriptionInput extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding / 2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Description',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextInputField(
            controller: controller,
            hint: 'Description (Optional)',
            focus: false, // Example: Change to true if you want it focused initially
            onTap: () {
              // Handle onTap logic here
              print('Description (Optional)');
            },
          ),
        ],
      ),
    );
  }
}
