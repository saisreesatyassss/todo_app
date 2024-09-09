// import 'package:flutter/material.dart';
// import 'components/back_decoration.dart';
// import 'components/bottom_nav_bar.dart';
// import 'components/floating_action.dart';
// import 'components/task_page_holder.dart';
// import 'components/upper_body.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   // final controller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Stack(
//         children: [
//           const BackColors(),
//           SafeArea(
//             child: Scaffold(
//                 floatingActionButtonLocation:
//                     FloatingActionButtonLocation.centerDocked,
//                 floatingActionButton: const FloatingButton(),
//                 bottomNavigationBar: BottomNavBar(),
//                 backgroundColor: Colors.transparent,
//                 body: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     UperBody(),
//                     const Expanded(
//                       child: TaskPageBody(),
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../maps/MapScreen.dart';
import 'components/back_decoration.dart';
import 'components/bottom_nav_bar.dart';
import 'components/floating_action.dart'; 
import 'first.dart';
import 'fourth.dart';
import '../groups/second.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 0;

  final List<Widget> _pages = [
    first(),
    second(),
     MapScreen(),
    SignOutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const BackColors(),
          SafeArea(
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const FloatingButton(),
              bottomNavigationBar: BottomNavBar(
                activeIndex: _activeIndex,
                onTabSelected: (index) {
                  setState(() {
                    _activeIndex = index;
                  });
                },
              ),
              backgroundColor: Colors.transparent,
              body: _pages[_activeIndex],
            ),
          ),
        ],
      ),
    );
  }
}
