import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'text_input.dart';

class DescriptionInput extends StatelessWidget {
  DescriptionInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: defaultPadding / 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Description',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          TextInputField(
            hint: 'Description (Optional)',
            focus:
                false, // Example: Change to true if you want it focused initially
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
