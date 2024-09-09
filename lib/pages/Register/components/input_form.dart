import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'button.dart';
import 'text_field.dart'; // Replace with the correct path to your InputField widget

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://todo-nodejs-server.onrender.com/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );
      // Optionally add navigation logic here
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration failed!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        const Text(
          '  Name',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        InputField(
          controller: _nameController,
          hint: "Enter Your Name",
          correct: false,
          hideText: false,
          prefix: const Icon(Icons.person),
        ),
        const SizedBox(height: 20),
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
          hint: "Enter Your @gmail.com",
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
          hint: "Pick a strong password",
          correct: false,
          hideText: true,
          prefix: const Icon(Icons.lock),
        ),
        const SizedBox(height: 40),
        AccountButton(
          text: "Create Account",
          tag: "create_account",
          onTap: () async {
            _register();
            await Future.delayed(Duration(seconds: 2));
            // Handle the result of the async operation
          },
        ),
      ],
    );
  }
}
