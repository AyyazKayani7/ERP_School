import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddButton1 extends StatelessWidget {
  String data;
  Color color;
  Color textColor;
  VoidCallback onTap;
  double height;
  double width;
  double textSize;
  FontWeight textWeight;
  AddButton1(
      {super.key,
      required this.data,
      required this.onTap,
      this.color = Colors.grey,
      this.textColor = Colors.white,
      this.height = 40,
      this.width = 140,
      this.textSize = 20,
      this.textWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            //border: Border.all(width: 1),
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Center(
          child: Text(
            style: TextStyle(
                color: textColor, fontSize: textSize, fontWeight: textWeight),
            data,
          ),
        ),
      ),
    );
  }
}
