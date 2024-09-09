import 'package:flutter/material.dart';

import 'group_list.dart';
  

class GroupPageBody extends StatelessWidget {
  const GroupPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          margin: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(.6),
                    Colors.white.withOpacity(.5),
                    Colors.white.withOpacity(.4),
                    Colors.white.withOpacity(.3),
                    Colors.white.withOpacity(.2),
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.0),
                    Colors.white.withOpacity(.0),
                  ])),
          // child: GroupPageView(),
          child: GroupList(
            index: 1,
          ),
        )),
       ],
    );
  }
}
