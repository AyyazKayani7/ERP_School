// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldPassword extends StatelessWidget {
  Widget? sufixIcon;
  TextEditingController controller;
  double height, width;
  String hintText;
  bool obsecure;
  //InputBorder border;
  Color hintTextColor;

  TextFieldPassword(
      {super.key,
      this.sufixIcon,
      required this.controller,
      this.height = 50,
      this.width = 300, // width used double.infinity below
      this.hintText = 'Place Text Here',
      this.obsecure = true,
      this.hintTextColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    // bool checkObsecure;
    // widget.obsecure ? checkObsecure = true : checkObsecure = false;
    //obsecure ? checkObsecure = true : checkObsecure = false;
    return SizedBox(
      //margin: const EdgeInsets.only(left: 10, right: 10),

      height: height,
      width: width,
      child: TextField(
        obscureText: obsecure ? true : obsecure = false,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: sufixIcon),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
          ),
        ),
      ),
    );
  }
}
