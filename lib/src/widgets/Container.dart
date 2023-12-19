import 'package:flutter/material.dart';


// ignore: must_be_immutable
class AddContainerImage extends StatelessWidget {
  double height, width;
  double horizontal, vertical;
  Color color;
  String img;
  AddContainerImage(
      {super.key,
      required this.height,
      required this.width,
      this.vertical = 0,
      this.horizontal = 0,
      this.color = Colors.white,
      this.img = 'assets/whiteBackground.png'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img)),
          color: color,
        ),
      ),
    );
  }
}
