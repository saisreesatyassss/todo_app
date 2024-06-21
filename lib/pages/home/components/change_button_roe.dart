import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'change_icon.dart';
import 'today_button.dart';

class ChangeButtonRow extends StatelessWidget {
  ChangeButtonRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.06),
      child: Row(
        children: [
          TodayButton(),
          Spacer(),
          InkWell(
              onTap: () => {},
              child: ChangeIconButton(
                  icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 15,
              ))),
          SizedBox(
            width: defaultPadding / 2,
          ),
          InkWell(
              onTap: () =>{ },
              child: ChangeIconButton(
                  icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 15,
              ))),
        ],
      ),
    );
  }
}
