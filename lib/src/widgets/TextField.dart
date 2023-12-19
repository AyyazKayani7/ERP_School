// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  Widget? sufixIcon;
  TextEditingController textEditingController;
  double height, width;
  String hintText;
  bool obsecure;
  double horizontalPadding;
  //InputBorder border;
  Color hintTextColor;

  CustomTextField(
      {super.key,
      this.sufixIcon,
      required this.textEditingController,
      this.horizontalPadding = 10,
      this.height = 50,
      this.width = 300, // width used double.infinity below
      this.hintText = 'Place Text Here',
      this.obsecure = true,
      this.hintTextColor = const Color.fromARGB(255, 226, 155, 155)});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    bool checkObsecure;
    widget.obsecure ? checkObsecure = true : checkObsecure = false;
    //obsecure ? checkObsecure = true : checkObsecure = false;
    return Container(
      //margin: const EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      decoration: const BoxDecoration(
          //border: Border.all(),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 4),
                spreadRadius: 0.5,
                blurRadius: 7)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      height: widget.height,
      width: double.infinity,
      child: TextField(
        obscureText: widget.obsecure ? false : widget.obsecure = false,
        controller: widget.textEditingController,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: widget.sufixIcon
              // GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         widget.obsecure = !widget.obsecure;
              //       });
              //     },
              //     child: widget.obsecure
              //         ? Image.asset(
              //             widget.img,
              //             // height: 5,
              //             // width: 5,
              //           )
              //         : const Icon(Icons.visibility),
              //   )
              // : Image.asset(
              //     widget.img,
              //     // height: 5,
              //     // width: 5,
              //   ),
              ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          hintText: widget.hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: widget.hintTextColor,
          ),
        ),
      ),
    );
  }
}
