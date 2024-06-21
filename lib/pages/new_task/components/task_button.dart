import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false; // Replace with your loading state management logic

    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(80),
          topLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          colors: [lightOrange, darkOrange, darkOrange],
        ),
      ),
      child: isLoading
          ? Container(
              height: 15,
              width: 15,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              'Create Task',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
    );
  }
}
