// import 'package:flutter/material.dart';

// class AccountButton extends StatefulWidget {
//   final String text;
//   final String? tag;
//   final VoidCallback? onTap;

//   const AccountButton({
//     super.key,
//     required this.text,
//     this.tag,
//     this.onTap,
//   });

//   @override
//   _AccountButtonState createState() => _AccountButtonState();
// }

// class _AccountButtonState extends State<AccountButton> {
//   bool _loading = false;

//   void _handleTap() async {
//     if (_loading) return;

//     setState(() {
//       _loading = true;
//     });

//     // Call the onTap callback if provided
//     if (widget.onTap != null) {
//       widget.onTap!();
//     }

//     // Simulate a network request or any other async operation
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _loading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: widget.tag ?? "TAG",
//       child: GestureDetector(
//         onTap: _handleTap,
//         child: Container(
//           height: 65,
//           width: double.infinity,
//           alignment: Alignment.center,
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: const LinearGradient(
//               colors: [Colors.purpleAccent, Colors.pinkAccent],
//             ),
//           ),
//           child: _loading
//               ? const SizedBox(
//                   height: 15,
//                   width: 15,
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 )
//               : Material(
//                   color: Colors.transparent,
//                   child: Text(
//                     widget.text,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AccountButton extends StatefulWidget {
  final String text;
  final String? tag;
  final VoidCallback? onTap;

  const AccountButton({
    super.key,
    required this.text,
    this.tag,
    this.onTap,
  });

  @override
  _AccountButtonState createState() => _AccountButtonState();
}

class _AccountButtonState extends State<AccountButton> {
  bool _loading = false;

  void _handleTap() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    // Call the onTap callback if provided
    if (widget.onTap != null) {
      widget.onTap!();
    }

    // Simulate a network request or any other async operation
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag ?? "TAG",
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          height: 65,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Colors.purpleAccent, Colors.pinkAccent],
            ),
          ),
          child: _loading
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Material(
                  color: Colors.transparent,
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
