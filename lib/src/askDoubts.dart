import 'package:erp_school/src/widgets/addButton.dart';
import 'package:erp_school/src/widgets/buttonCenterIcon.dart';
import 'package:flutter/material.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class AskDoubts extends StatefulWidget {
  const AskDoubts({super.key});

  @override
  State<AskDoubts> createState() => _AskDoubtsState();
}

class _AskDoubtsState extends State<AskDoubts> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = 'Fever';
    description.text =
        'Dear Sir, As I am suffering with viral fever I will not be able to attend the classes for Today. Please accept this request and kindly grant me leave.';

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MySize.size150,
            width: width,
            decoration: const BoxDecoration(
              //color: Colors.amber
              gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2]),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, top: height * 0.1),
                  child: Image.asset(
                      height: height * 0.2,
                      width: width * 0.8,
                      AssetImages.starPatternDashboard),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05
                      //MySize.size18
                      ),
                  width: width * 0.9, //MySize.size360,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Future.delayed(const Duration(seconds: 1), () {
                            //timeTableProvider.clear();
                          });
                        },
                        child: Image.asset(
                            width: MySize.size12,
                            height: MySize.size20,
                            AssetImages.backIconWhite),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      AddText(
                        data: 'Ask Doubt',
                        color: Colors.white,
                        textSize: MySize.size20,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  //color: Colors.amber
                  gradient: LinearGradient(colors: [
                AppColors.appGradient1,
                AppColors.appGradient2
              ])),
              child: Container(
                width: width,
                //color: Colors.green,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.0575),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        AddText(
                          data: 'Class Teacher',
                          textSize: 12,
                          textWeight: FontWeight.w400,
                          color: AppColors.greyTextColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        AddText(
                          data: 'Alexa Clark',
                          textSize: 16,
                          textWeight: FontWeight.w600,
                          color: AppColors.grey7777,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.greyTextColor,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AddText(
                          data: 'Application Title',
                          textSize: 12,
                          textWeight: FontWeight.w400,
                          color: AppColors.greyTextColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: title,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AddText(
                          data: 'Description',
                          textSize: 12,
                          textWeight: FontWeight.w400,
                          color: AppColors.greyTextColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          maxLines: 4,
                          controller: description,
                          decoration: const InputDecoration(),
                          style: TextStyle(),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AddButton(
                            width: width,
                            gradientColor1: AppColors.appGradient2,
                            gradientColor2: AppColors.appGradient1,
                            height: 50,
                            data: 'Send Request',
                            textWeight: FontWeight.w600,
                            onTap: () {})
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Expanded(
                child:
                    Image.asset(AssetImages.lowerBackGroundPercentageScreen)),
          )
        ],
      ),
    );
  }
}
