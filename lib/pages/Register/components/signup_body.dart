import 'package:flutter/material.dart';
import 'package:todo_app/pages/Register/components/button.dart';
import '../../../utils/constants.dart';
import '../../sign in/sign_in.dart';
import 'appbar.dart';
import 'input_form.dart';
import 'signup_options.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});

  // final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const SignUpBar(),
            const SizedBox(
              height: 50,
            ),
            const Text(
               'Sign up .',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            InputForm(),
            const SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      )),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.orange,
                        ))
                  ])),
                )),
            SizedBox(
              height: defaultPadding,
            )
          ],
        ),
      ),
    );
  }
}
