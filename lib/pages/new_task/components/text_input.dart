import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class TextInputField extends StatefulWidget {
  final String hint;
  final bool focus;
  final VoidCallback onTap;

  const TextInputField({
    Key? key,
    required this.hint,
    required this.focus,
    required this.onTap,
  }) : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  TextEditingController _controller = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    _isFocused = widget.focus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(_isFocused ? 2 : 1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _isFocused ? darkOrange : Colors.grey,
      ),
      child: TextFormField(
        controller: _controller,
        onTap: () {
          setState(() {
            _isFocused = true;
          });
          widget.onTap();
        },
        onChanged: (value) {
          // You can perform actions on text change if needed
        },
        onFieldSubmitted: (value) {
          // You can perform actions when the field is submitted if needed
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: widget.hint,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
