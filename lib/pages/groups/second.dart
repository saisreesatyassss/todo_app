import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../home/components/back_decoration.dart';
import '../home/components/custom_app_bar.dart';
import 'group_page_holder.dart';

class second extends StatelessWidget {
  second({super.key});
   @override
  Widget build(BuildContext context) {
    return const Material(
      child: Stack(
        children: [
          BackColors(),
          SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),
                    CustomAppBar(),
                    const Expanded(
                      child: GroupPageBody(),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
