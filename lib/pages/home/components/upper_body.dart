// import 'package:flutter/material.dart';
// import '../../../utils/constants.dart';
// import 'custom_app_bar.dart';
// import 'date_container.dart';

// class UperBody extends StatefulWidget {
//   UperBody({super.key});

//   @override
//   _UperBodyState createState() => _UperBodyState();
// }

// class _UperBodyState extends State<UperBody> {
//   int _currentIndex = 0;
//   final ScrollController _scrollController = ScrollController();

//   void _handleDateContainerTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: defaultPadding,
//         ),
//         CustomAppBar(),
//         SizedBox(
//           height: 150,
//           child: ListView.builder(
//             controller: _scrollController,
//             itemCount: 7,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(bottom: 30, top: defaultPadding),
//             itemBuilder: (context, index) {
//               return DateContainer(
//                 index: index,
//                 currentIndex: _currentIndex,
//                 onTap: _handleDateContainerTap,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'custom_app_bar.dart';
import 'date_container.dart';

class UperBody extends StatefulWidget {
  UperBody({super.key});

  @override
  _UperBodyState createState() => _UperBodyState();
}

class _UperBodyState extends State<UperBody> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  void _handleDateContainerTap(int index) {
    // print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    return Column(
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        CustomAppBar(),
        SizedBox(
          height: 150,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 7,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 30, top: defaultPadding),
            itemBuilder: (context, index) {
              DateTime date = currentDate.add(Duration(days: index));
              return DateContainer(
                index: index,
                currentIndex: _currentIndex,
                onTap: _handleDateContainerTap,
                date: date,
              );
            },
          ),
        ),
      ],
    );
  }
}
