import 'package:erp_school/src/widgets/addButton1.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class AlertDialogue extends StatelessWidget {
  //String title;
  TextEditingController controller;
  VoidCallback onUpdate;
  VoidCallback onCancel;
  String txtHint;
  AlertDialogue(
      {super.key,
      required this.onUpdate,
      required this.onCancel,
      required this.controller,
      //required this.title,
      required this.txtHint});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      // title: AddText(
      //   width: width * 0.7,
      //   data: title,
      //   textSize: 18,
      // ),
      actions: [
        AddButton1(
          width: 100,
          data: 'Update',
          onTap: onUpdate,
          color: Color(AppColors.colorTheme),
        ),
        const SizedBox(
          width: 30,
        ),
        AddButton1(
          width: 100,
          onTap: onCancel,
          data: 'Cancel',
          color: Color(AppColors.colorTheme),
        )
      ],
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: width * 0.7,
          padding: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 4),
                    spreadRadius: 0.5,
                    blurRadius: 7)
              ]),
          child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: txtHint),
            controller: controller,
          ),
        ),
      ),
    );
  }
}
