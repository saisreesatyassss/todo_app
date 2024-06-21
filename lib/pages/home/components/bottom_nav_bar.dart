// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// // Example pages
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(child: Text('Home Page')),
//     );
//   }
// }

// class ACPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('AC')),
//       body: Center(child: Text('AC Page')),
//     );
//   }
// }

// class EditNotePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Edit Note')),
//       body: Center(child: Text('Edit Note Page')),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: Center(child: Text('Profile Page')),
//     );
//   }
// }

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key, required int activeIndex});

//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _activeIndex = 0;
//   final List<Widget> _pages = [
//     HomePage(),
//     ACPage(),
//     EditNotePage(),
//     ProfilePage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBottomNavigationBar(
//       elevation: 10,
//       height: 60,
//       inactiveColor: Colors.grey,
//       activeColor: Colors.orange,
//       icons: const [
//         Icons.home_max,
//         Icons.ac_unit,
//         Icons.edit_note_sharp,
//         Icons.person_outline_rounded
//       ],
//       activeIndex: _activeIndex,
//       gapLocation: GapLocation.center,
//       notchSmoothness: NotchSmoothness.verySmoothEdge,
//       leftCornerRadius: 32,
//       rightCornerRadius: 32,
//       onTap: (index) {
//         setState(() {
//           _activeIndex = index;
//         });
//       },
//     );
//   }
// }
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({
    super.key,
    required this.activeIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      elevation: 10,
      height: 60,
      inactiveColor: Colors.grey,
      activeColor: Colors.orange,
      icons: const [
        Icons.home_max,
        Icons.ac_unit,
        Icons.edit_note_sharp,
        Icons.person_outline_rounded
      ],
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: onTabSelected,
    );
  }
}
