import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/pages/RegisterScreen.dart';
import 'package:todo_app/pages/create_group_screen.dart';
import 'package:todo_app/pages/group_tasks_screen.dart';
import 'package:todo_app/pages/home.dart';
import 'pages/sign_in_screen.dart';

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
      title: 'Todo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
      routes: {
        '/sign-in': (context) => SignInScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => Home(),
        '/groupTasks': (context) => GroupTasksScreen(
            groupId: ModalRoute.of(context)!.settings.arguments as String),
        '/createGroup': (context) => CreateGroupScreen(),
      },
    );
  }
}
