import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

class SelectImageList extends StatefulWidget {
  const SelectImageList({Key? key}) : super(key: key);

  @override
  _SelectImageListState createState() => _SelectImageListState();
}

class _SelectImageListState extends State<SelectImageList> {
  int selectedImageIndex = -1;

  void onImageSelected(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [lightOrange, darkOrange]),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Illustrations',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onImageSelected(index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: selectedImageIndex == index
                          ? const LinearGradient(colors: [lightAccentBlue, lightAccentBlue])
                          : null,
                      boxShadow: selectedImageIndex == index
                          ? [
                              BoxShadow(
                                color: lightAccentBlue,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ]
                          : null,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        Utils.images['$index']!, // Replace '1' with your actual image key
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
