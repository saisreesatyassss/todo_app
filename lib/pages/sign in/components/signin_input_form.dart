import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Register/components/button.dart';
import '../../Register/components/text_field.dart'; // Replace with correct path to your InputField widget
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/pages/home.dart';

import '../../home/home.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _storage = const FlutterSecureStorage();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email and password cannot be empty')),
        );
      }
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://todo-nodejs-server.onrender.com/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (!mounted) return; // Check if the widget is still mounted

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String token = responseBody['accessToken'];

        await _storage.write(key: 'jwt', value: token);
        print('JWT Token: $token');

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );

          // Use WidgetsBinding to schedule the navigation to happen at the end of the frame
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          });
        }
        print("signing in...");
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed! ${response.body}')),
          );
        }
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        const Text(
          '  Email',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        InputField(
          controller: _emailController,
          hint: "Enter Your Email",
          correct: false,
          hideText: false,
          prefix: const Icon(Icons.email),
        ),
        const SizedBox(height: 20),
        const Text(
          '  Password',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        InputField(
          controller: _passwordController,
          hint: "Enter Your Password",
          correct: false,
          hideText: true,
          prefix: const Icon(Icons.lock),
        ),
        const SizedBox(height: 40),
        AccountButton(
          text: "Sign In",
          tag: "sign_in",
          onTap: () {
            _signIn();
          },
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     _signIn();
        //   },
        //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        //   child: Text('sign IN'),
        // ),
      ],
    );
  }
}
