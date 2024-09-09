import 'package:flutter/material.dart';
import '../../../utils/constants.dart'; // Adjust the path as per your project structure
import 'date_time_container.dart';

class DateTimeInput extends StatelessWidget {
  final String? selectedDate;
  final String? startTime;
  final String? endTime;
  final VoidCallback onDateTap;
  final VoidCallback onStartTimeTap;
  final VoidCallback onEndTimeTap;

  const DateTimeInput({
    Key? key,
    this.selectedDate,
    this.startTime,
    this.endTime,
    required this.onDateTap,
    required this.onStartTimeTap,
    required this.onEndTimeTap,
  }) : super(key: key);

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
              DateTimeContainer(
                text: selectedDate ?? 'Select Date',
                onTap: onDateTap,
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
              DateTimeContainer(
                text: startTime ?? 'Select Start Time',
                onTap: onStartTimeTap,
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
              DateTimeContainer(
                text: endTime ?? 'Select End Time',
                onTap: onEndTimeTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
