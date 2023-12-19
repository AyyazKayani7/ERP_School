// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWithInfinity extends StatelessWidget {
  String data;
  Color color;
  FontWeight textWeight;
  double textSize;
  TextAlign textAlign;
  //double width;
  double height;
  bool infinity;

  TextWithInfinity(
      {super.key,
      required this.data,
      this.color = Colors.black,
      this.textWeight = FontWeight.normal,
      this.textSize = 16,
      this.textAlign = TextAlign.center,
      this.height = 1000,
      //this.width = 250,
      this.infinity = false});

  @override
  Widget build(BuildContext context) {
    //height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width * 0.8,
      decoration: const BoxDecoration(
          //border: Border.all(width: 1)
          // border: Border(
          //     top: BorderSide(),
          //     bottom: BorderSide(),
          //     left: BorderSide(),
          //     right: BorderSide())
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          data,
          style: TextStyle(
            //fontFamily: 'poppins',
            fontWeight: textWeight,
            color: color,
            fontSize: textSize,
          ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}
