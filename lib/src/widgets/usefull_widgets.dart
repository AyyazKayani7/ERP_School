import 'package:flutter/material.dart';

Widget getText(String data, double FontSize, Color Color, FontWeight? weight) {
  return Text(
    data,
    style: TextStyle(fontSize: FontSize, color: Color, fontWeight: weight),
  );
}
