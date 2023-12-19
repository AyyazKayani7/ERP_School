// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  Widget suffixIcon;
  bool obsecure;
  String hintTxt;
  TextEditingController controller;
  SimpleTextField(
      {super.key,
      required this.hintTxt,
      required this.controller,
      required this.obsecure,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          suffix: suffixIcon,
          hintText: hintTxt,
          border: InputBorder.none),
    );
  }
}
