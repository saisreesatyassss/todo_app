import 'package:flutter/material.dart';
import '../../../utils/constants.dart'; // Adjust the path as per your project structure
import 'date_time_container.dart';

class DateTimeInput extends StatelessWidget {
  DateTimeInput({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              InkWell(
                onTap: () {
                  // Handle date selection logic here
                },
                child: DateTimeContainer(
                  text: 'dd/mm/yyyy', // Replace with actual selectedDate value
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'S-Time',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              InkWell(
                onTap: () {
                  // Handle start time selection logic here
                },
                child: DateTimeContainer(
                  text: 'hh:mm:a', // Replace with actual startTime value
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'E-Time',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              InkWell(
                onTap: () {
                  // Handle end time selection logic here
                },
                child: DateTimeContainer(
                  text: 'hh:mm:a', // Replace with actual endTime value
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
