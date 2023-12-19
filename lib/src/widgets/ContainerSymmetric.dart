// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ContainerSymmetric extends StatelessWidget {
  double height, width;
  double horizontal, vertical;
  ContainerSymmetric(
      {super.key,
      required this.height,
      required this.width,
      this.vertical = 0,
      this.horizontal = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    );
  }
}
