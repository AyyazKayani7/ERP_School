import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/dateSheet.dart';
import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/fonts.dart';
import 'utilities/mySize.dart';
import 'widgets/addButton.dart';
import 'widgets/addText.dart';

class DateSheetScreen extends StatefulWidget {
  const DateSheetScreen({super.key});

  @override
  State<DateSheetScreen> createState() => _DateSheetScreenState();
}

class _DateSheetScreenState extends State<DateSheetScreen> {
  @override
  Widget build(BuildContext context) {
    DateSheet d1 = DateSheet('Science', DateTime(2023, 1, 11, 9));
    DateSheet d2 = DateSheet('English', DateTime(2023, 1, 13, 9));
    DateSheet d3 = DateSheet('Hindi', DateTime(2023, 1, 15, 9));
    DateSheet d4 = DateSheet('Math', DateTime(2023, 1, 18, 9));
    DateSheet d5 = DateSheet('Social Study', DateTime(2023, 1, 20, 9));
    DateSheet d6 = DateSheet('Drawing', DateTime(2023, 1, 22, 9));
    DateSheet d7 = DateSheet('Computer', DateTime(2023, 1, 25, 9));
    List<DateSheet> d = [];
    d.add(d1);
    d.add(d2);
    d.add(d3);
    d.add(d4);
    d.add(d5);
    d.add(d6);
    d.add(d7);
    DateFormat dayName = DateFormat('EEEE');
    DateFormat monthName = DateFormat('MMM');

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

                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            width: MySize.size12,
                            height: MySize.size20,
                            AssetImages.backIconWhite),
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                //color: Colors.amber
                gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2],
                ),
              ),
              child: Container(
                width: width,
                //color: Colors.green,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child:
                    // ListView.separated(
                    //   separatorBuilder: (context, index) => Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           SizedBox(
                    //             width: width * 0.15,
                    //           ),
                    //           SizedBox(
                    //             width: width * 0.7,
                    //             child: const Divider(
                    //               height: 1,
                    //               thickness: 1.2,
                    //               color: AppColors.greyDivider1,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (content, index) {
                    DateSheet dl = d[index];
                    String amPm = dl.date!.hour < 12 ? 'AM' : 'PM';

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.0575),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.15,
                              ),
                              SizedBox(
                                width: width * 0.7,
                                child: const Divider(
                                  height: 1,
                                  thickness: 1.2,
                                  color: AppColors.greyDivider1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  AddText(
                                    data: dl.date!.day.toString(),
                                    textSize: 26,
                                    fontFamily: "BebasNeue",
                                    textWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  AddText(
                                    data: monthName.format(dl.date!),
                                    textSize: 13,
                                    fontFamily: "BebasNeue",
                                    textWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              SizedBox(
                                width: width * 0.7,
                                // height: 20,
                                // decoration: BoxDecoration(
                                //   border: Border(
                                //     top: BorderSide(
                                //         width: 1, color: AppColors.greyDivider),
                                //     bottom: BorderSide(
                                //         width: 1, color: AppColors.greyDivider),
                                //   ),
                                // ),
                                child: Column(
                                  children: [
                                    // const Divider(
                                    //   height: 1,
                                    //   thickness: 1.2,
                                    //   color: AppColors.greyDivider1,
                                    // ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 11,
                                            ),
                                            AddText(
                                              data: dl.courseTitle!,
                                              textSize: 16,
                                              textWeight: FontWeight.w600,
                                            ),
                                            AddText(
                                              data: dayName.format(dl.date!),
                                              textSize: 12,
                                              textWeight: FontWeight.w400,
                                              color: AppColors.greyTextColor,
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Image.asset(
                                            height: 13,
                                            width: 13,
                                            AssetImages.clockIcon),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        AddText(
                                          data:
                                              '${dl.date!.hour}:${dl.date!.minute.toString().padLeft(2, '0')} $amPm',
                                          textSize: 13,
                                          color: AppColors.greyTextColor,
                                          textWeight: FontWeight.w600,
                                        )
                                      ],
                                    ),
                                    // const Divider(
                                    //   height: 1,
                                    //   thickness: 1.2,
                                    //   color: AppColors.greyDivider1,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          index == d.length - 1
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.15,
                                        ),
                                        SizedBox(
                                          width: width * 0.7,
                                          child: const Divider(
                                            height: 1,
                                            thickness: 1.2,
                                            color: AppColors.greyDivider1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                )
                              : Container(),

                          // const SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(AssetImages.lowerBackGroundPercentageScreen),
          )
        ],
      ),
    );
  }
}
