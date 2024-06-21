import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'text_input.dart'; 

class CategoryInput extends StatelessWidget {
  CategoryInput({super.key});

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
              'Category',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          
           TextInputField(
          hint: 'Select Category',
          focus: false, // Example: Change to true if you want it focused initially
          onTap: () {
            // Handle onTap logic here
            print('Text field tapped!');
          },
        ),
        ],
      ),
    );
  }
}
