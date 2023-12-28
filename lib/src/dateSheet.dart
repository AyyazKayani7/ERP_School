import 'package:flutter/material.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/fonts.dart';
import 'utilities/mySize.dart';
import 'widgets/addButton.dart';
import 'widgets/addText.dart';

class DateSheet extends StatefulWidget {
  const DateSheet({super.key});

  @override
  State<DateSheet> createState() => _DateSheetState();
}

class _DateSheetState extends State<DateSheet> {
  @override
  Widget build(BuildContext context) {
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
                        data: 'DateSheet',
                        fontFamily: Fonts.sourceSansPro,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              AddText(
                                data: '11',
                                textSize: 26,
                                fontFamily: "BebasNeue",
                                textWeight: FontWeight.w400,
                              ),
                              AddText(
                                data: 'Jan',
                                textSize: 13,
                                fontFamily: "BebasNeue",
                                textWeight: FontWeight.w600,
                              )
                            ],
                          ),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Container(
                            width: width * 0.7,
                            height: 20,
                            // decoration: BoxDecoration(
                            //   border: Border(
                            //     top: BorderSide(
                            //         width: 1, color: AppColors.greyDivider),
                            //     bottom: BorderSide(
                            //         width: 1, color: AppColors.greyDivider),
                            //   ),
                            // ),
                            child: const Column(
                              children: [
                                Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: AppColors.greyTextColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
