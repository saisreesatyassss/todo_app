import 'package:flutter/material.dart';
import 'package:todo_app/pages/sign%20in/components/signin_bar.dart';
import '../../../utils/constants.dart';
import '../../Register/components/button.dart';
import '../../Register/sign_up.dart';
import 'signin_input_form.dart';

class SignInBody extends StatelessWidget {
  SignInBody({super.key});
  // final controller = Get.put(SignInController());
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
            const SignInBar(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Sign in  .',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            // const SignUpOptions(),
            SignInForm(),

            const SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      )),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: Colors.orange,
                        ))
                  ])),
                )),
            const SizedBox(
              height: defaultPadding,
            )
          ],
        ),
      ),
    );
  }
}
