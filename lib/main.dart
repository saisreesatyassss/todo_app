// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:todo_app/pages/sign_in_screen.dart';

// import 'pages/opening.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//             apiKey: "AIzaSyARwTjNiZP95Pt3d1CgMvxjDPyy6d_VUxI",
//             authDomain: "todo-d182a.firebaseapp.com",
//             projectId: "todo-d182a",
//             storageBucket: "todo-d182a.appspot.com",
//             messagingSenderId: "62902980244",
//             appId: "1:62902980244:web:0ffd190f54477028732e81",
//             measurementId: "G-M5MCDYF5WZ"));
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Firebase Auth',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//        home: Opening(),
//       routes: {
//         '/sign-in': (context) => SignInScreen(),
//       },
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/pages/auth/login_screen.dart';
import 'pages/sign_in_screen.dart';
import 'pages/opening.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
            apiKey: "AIzaSyARwTjNiZP95Pt3d1CgMvxjDPyy6d_VUxI",
            authDomain: "todo-d182a.firebaseapp.com",
            projectId: "todo-d182a",
            storageBucket: "todo-d182a.appspot.com",
            messagingSenderId: "62902980244",
            appId: "1:62902980244:web:0ffd190f54477028732e81",
            measurementId: "G-M5MCDYF5WZ",
          )
        : null,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/sign-in': (context) => SignInScreen(),
      },
    );
  }
}
