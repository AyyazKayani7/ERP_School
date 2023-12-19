import 'package:flutter/material.dart';

class BorderCheck extends StatelessWidget {
  Widget child;
  BorderCheck({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(width: 1)), child: child);
  }
}
