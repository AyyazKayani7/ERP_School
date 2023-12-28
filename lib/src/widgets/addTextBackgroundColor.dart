// ignore: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTextBackColor extends StatelessWidget {
  String data;
  Color color;

  Color backgroundColor;
  FontWeight textWeight;
  String fontFamily;
  double textSize;
  TextAlign textAlign;
  double width, height;
  bool infinity;
  double marginLeft, marginRight, marginTop, marginBottom;

  AddTextBackColor(
      {super.key,
      required this.data,
      this.fontFamily = "Roboto",
      this.color = Colors.black,
      this.backgroundColor = Colors.white,
      this.textWeight = FontWeight.normal,
      this.textSize = 16,
      this.textAlign = TextAlign.center,
      this.height = 30,
      this.width = 250,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginTop = 0,
      this.infinity = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginBottom),
      decoration: BoxDecoration(
        color: backgroundColor,
        //border: Border.all(),
        // border: Border(
        //     top: BorderSide(),
        //     bottom: BorderSide(),
        //     left: BorderSide(),
        //     right: BorderSide())
      ),
      child: Text(
        data,
        maxLines: 2,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          //fontFamily: 'poppins',
          //fontFamily: fontFamily,
          fontWeight: textWeight,
          color: color,
          fontSize: textSize,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
