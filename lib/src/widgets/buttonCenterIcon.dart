import 'package:erp_school/src/utilities/mySize.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCenterIcon extends StatelessWidget {
  String data;
  Color color;
  Widget? buttonSuffixIcon;
  Color textColor;
  VoidCallback onTap;
  double height;
  double width;
  double textSize;
  Color gradientColor1;
  Color gradientColor2;
  FontWeight textWeight;
  double iconWidthForTextCenter;
  double bottomLeftRadius, bottomRightRadius;
  ButtonCenterIcon({
    super.key,
    required this.data,
    required this.onTap,
    this.iconWidthForTextCenter = 0,
    this.color = Colors.grey,
    this.textColor = Colors.white,
    this.buttonSuffixIcon,
    this.height = 40,
    this.width = 140,
    this.textSize = 20,
    this.bottomLeftRadius = 10,
    this.bottomRightRadius = 10,
    this.gradientColor1 = Colors.grey,
    this.gradientColor2 = Colors.grey,
    this.textWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            //border: Border.all(width: 1),
            gradient: LinearGradient(colors: [gradientColor1, gradientColor2]),
            //color: color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bottomLeftRadius),
                bottomRight: Radius.circular(bottomRightRadius))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  //padding: const EdgeInsets.only(left: 40),
                  alignment: Alignment.center,
                  child: Text(
                    style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                        fontWeight: textWeight),
                    data,
                  ),
                ),
              ),
              SizedBox(
                width: MySize.size10,
              ),
              Container(
                  //padding: const EdgeInsets.only(right: 20),
                  child: buttonSuffixIcon ?? Container()),
            ],
          ),
        ),
      ),
    );
  }
}
