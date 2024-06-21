import 'package:flutter/material.dart'; 
import 'icon_container.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () =>{},
      child: const IconContainer(
          widget: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              // FontAwesomeIcons.google,
              //   size: 18,
              //   color: Colors.orange,
              // ),
              SizedBox(width: 10,),
              Text('Continue with Google'),
            ],
          )),
    );
  }
}
