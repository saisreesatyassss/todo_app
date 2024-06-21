import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'dates.dart';

class DateContainer extends StatefulWidget {
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  DateContainer({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _DateContainerState createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate =
        DateTime.now(); // Replace with your actual date logic

    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => widget.onTap(widget.index),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 110,
          width: 70,
          margin: EdgeInsets.only(left: size.width * 0.05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            gradient: widget.currentIndex == widget.index
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [lightOrange, darkOrange],
                  )
                : null,
            boxShadow: [
              widget.currentIndex == widget.index
                  ? const BoxShadow(
                      color: lightOrange,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    )
                  : const BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    ),
            ],
          ),
          child: Dates(date: currentDate)),
    );
  }
}
