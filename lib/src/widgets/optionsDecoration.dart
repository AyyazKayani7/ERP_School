import 'package:erp_school/src/utilities/mySize.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';

// ignore: must_be_immutable
class OptionDecoration extends StatefulWidget {
  Widget child;
  OptionDecoration({super.key, required this.child});

  @override
  State<OptionDecoration> createState() => _OptionDecorationState();
}

class _OptionDecorationState extends State<OptionDecoration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MySize.size60,
      width: MySize.size370,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.greyDivider,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: widget.child,
    );
  }
}
