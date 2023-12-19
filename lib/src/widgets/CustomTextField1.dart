// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField1 extends StatefulWidget {
  Widget? sufixIcon;
  TextEditingController textEditingController;
  double height, width;
  String hintText;
  TextInputType textInputType;
  //double horizontalPadding;
  //InputBorder border;
  Color hintTextColor;
  bool isFocusNode;

  CustomTextField1(
      {super.key,
      this.sufixIcon,
      required this.textEditingController,
      this.textInputType = TextInputType.text,
      //this.horizontalPadding = 10,
      this.height = 50,
      this.width = 300, // width used double.infinity below
      this.hintText = 'Place Text Here',
      this.isFocusNode = false,
      this.hintTextColor = const Color.fromARGB(255, 226, 155, 155)});

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // bool checkObsecure;
    // widget.obsecure ? checkObsecure = true : checkObsecure = false;
    //obsecure ? checkObsecure = true : checkObsecure = false;
    return Container(
        //margin: const EdgeInsets.only(left: 10, right: 10),
        //margin: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        decoration: const BoxDecoration(
            //border: Border.all(),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 225, 223, 223),
                  offset: Offset(0, 6),
                  spreadRadius: 0.8,
                  blurRadius: 7)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        height: widget.height,
        width: widget.width,
        child: widget.isFocusNode
            ? GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                child: AbsorbPointer(
                  absorbing: true,
                  child: TextFormField(
                    focusNode: _focusNode,
                    keyboardType: widget.textInputType,
                    controller: widget.textEditingController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: widget.hintTextColor,
                      ),
                    ),
                  ),
                ),
              )
            : TextFormField(
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                keyboardType: widget.textInputType,
                controller: widget.textEditingController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
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
              ));
  }
}
