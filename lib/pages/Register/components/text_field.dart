// import 'package:flutter/material.dart';
// import 'textfield_sufiix.dart';

// class InputField extends StatefulWidget {
//   final String hint;
//   final bool? hideText;
//   final bool? correct;
//   final Widget? prefix;

//   const InputField({
//     Key? key,
//     required this.hint,
//     this.correct,
//     this.hideText,
//     this.prefix,
//   }) : super(key: key);

//   @override
//   _InputFieldState createState() => _InputFieldState();
// }

// class _InputFieldState extends State<InputField> {
//   bool _focus = false;
//   bool _hideText = true;
//   TextEditingController _controller = TextEditingController();

//   void _handleFocusChange(bool hasFocus) {
//     setState(() {
//       _focus = hasFocus;
//     });
//   }

//   void _handleShowPass() {
//     setState(() {
//       _hideText = !_hideText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       padding: const EdgeInsets.all(1),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         gradient: _focus
//             ? const LinearGradient(colors: [
//                 Colors.purpleAccent,
//                 Colors.pink,
//               ])
//             : null,
//       ),
//       child: Focus(
//         onFocusChange: _handleFocusChange,
//         child: TextFormField(
//           controller: _controller,
//           obscureText: widget.hideText ?? false,
//           style: const TextStyle(
//               color: Colors.black, fontWeight: FontWeight.normal),
//           decoration: InputDecoration(
//             filled: true,
//             prefixIcon: widget.prefix,
//             suffixIcon: widget.hideText == true
//                 ? GestureDetector(
//                     onTap: _handleShowPass,
//                     child: _hideText
//                         ? const TextFieldSufix(
//                             icon: Icons.remove_red_eye,
//                             size: 13,
//                           )
//                         : const TextFieldSufix(
//                             icon: Icons.visibility_off,
//                             size: 13,
//                           ),
//                   )
//                 : widget.correct == true
//                     ? const TextFieldSufix(icon: Icons.done)
//                     : null,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide.none),
//             hoverColor: Colors.pinkAccent,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//             hintText: widget.hint,
//             hintStyle: const TextStyle(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 12),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'textfield_sufiix.dart';

class InputField extends StatefulWidget {
  final String hint;
  final bool? hideText;
  final bool? correct;
  final Widget? prefix;
  final TextEditingController? controller; // Add controller field

  const InputField({
    Key? key,
    required this.hint,
    this.correct,
    this.hideText,
    this.prefix,
    this.controller, // Accept controller as optional parameter
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _focus = false;
  bool _hideText = true;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Dispose the controller only if it was created here
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange(bool hasFocus) {
    setState(() {
      _focus = hasFocus;
    });
  }

  void _handleShowPass() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: _focus
            ? const LinearGradient(colors: [
                Colors.purpleAccent,
                Colors.pink,
              ])
            : null,
      ),
      child: Focus(
        onFocusChange: _handleFocusChange,
        child: TextFormField(
          controller: _controller,
          obscureText: widget.hideText ?? false,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            filled: true,
            prefixIcon: widget.prefix,
            suffixIcon: widget.hideText == true
                ? GestureDetector(
                    onTap: _handleShowPass,
                    child: _hideText
                        ? const TextFieldSufix(
                            icon: Icons.remove_red_eye,
                            size: 13,
                          )
                        : const TextFieldSufix(
                            icon: Icons.visibility_off,
                            size: 13,
                          ),
                  )
                : widget.correct == true
                    ? const TextFieldSufix(icon: Icons.done)
                    : null,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            hoverColor: Colors.pinkAccent,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
