import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'periority_container.dart';
import 'text_input.dart';

class LabelInput extends StatelessWidget {
  const LabelInput({Key? key});

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
                  hint: 'Enter Label',
                  focus: false, // Example: Change to true if you want it focused initially
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
              Text(
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
                    onTap: () {
                      // Handle low priority selection
                      // Example: togglePriority(true);
                    },
                    child: PeriorityContainer(
                      text: 'Low',
                      selected: true, // Example: Replace with actual lowPrioritySelected value
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  InkWell(
                    onTap: () {
                      // Handle high priority selection
                      // Example: togglePriority(false);
                    },
                    child: PeriorityContainer(
                      text: 'High',
                      selected: false, // Example: Replace with actual lowPrioritySelected value
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
