// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BarContainer extends StatelessWidget {
  String txt;
  double height, width, textSize;
  double icon1Height, icon1Width;
  double icon2Height, icon2Width;
  FontWeight weight;
  String imgSuffix, imgPrefix;
  BarContainer(
      {super.key,
      required this.txt,
      this.height = 60,
      this.width = 350,
      this.textSize = 15,
      this.icon1Height = 30,
      this.icon1Width = 30,
      this.icon2Height = 30,
      this.icon2Width = 30,
      this.imgSuffix = 'assets/whiteBackground.jpg',
      this.imgPrefix = 'assets/whiteBackground.jpg',
      this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    double mheight = MediaQuery.of(context).size.height;
    double mwidth = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0, 5),
              blurRadius: 7,
              spreadRadius: 0.5,
            ),
            // BoxShadow(color: Colors.red, offset: Offset(0, 4), blurRadius: 4),
            // BoxShadow(color: Colors.purple, offset: Offset(0, 4), blurRadius: 4)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: Colors.grey.shade200),
      child: Row(
        children: [
          SizedBox(
            width: mwidth * 0.05,
          ),
          SizedBox(
              // margin: EdgeInsets.symmetric(
              //     horizontal: mwidth * 0.05, vertical: 0),
              height: icon1Height,
              width: icon1Width,
              child: Image.asset(imgPrefix)),
          SizedBox(
            width: mwidth * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
            child: Text(
              txt,
              style: TextStyle(fontSize: textSize, fontWeight: weight),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: mwidth * 0.05, vertical: 0),
            child: SizedBox(
                height: icon2Height,
                width: icon2Width,
                child: Image.asset(imgSuffix)),
          )
        ],
      ),
    );
  }
}
