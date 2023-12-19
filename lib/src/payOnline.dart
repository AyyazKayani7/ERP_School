import 'package:erp_school/src/model/fee.dart';
import 'package:erp_school/src/widgets/addButton.dart';
import 'package:erp_school/src/widgets/addButton1.dart';
import 'package:erp_school/src/widgets/buttonCenterIcon.dart';
import 'package:erp_school/src/widgets/buttonSuffixIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class PayOnline extends StatefulWidget {
  DateTime dateOfFee;
  int totalFee;
  PayOnline({super.key, required this.dateOfFee, required this.totalFee});

  @override
  State<PayOnline> createState() => _PayOnlineState();
}

class _PayOnlineState extends State<PayOnline> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = widget.dateOfFee ?? DateTime.now();
    DateTime startDate = DateTime(currentDate.year, currentDate.month, 1);
    DateTime endDate =
        DateTime(currentDate.year, currentDate.month + 1, 0, 23, 59, 59);

    final dateMonthFormat = DateFormat('dd MMM yy');

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
            child: Column(
              children: [
                Container(
                  height: MySize.size150,
                  width: width,
                  decoration: const BoxDecoration(
                    //color: Colors.amber
                    gradient: LinearGradient(colors: [
                      AppColors.appGradient1,
                      AppColors.appGradient2
                    ]),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.1, top: height * 0.1),
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
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                  width: MySize.size12,
                                  height: MySize.size20,
                                  AssetImages.backIconWhite),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AddText(
                              data: 'Fees Due',
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
                height: height,
                width: width,
                //color: Colors.green,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05, top: 30, right: width * 0.05),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddText(
                            data: 'Date',
                            textSize: 12,
                            textWeight: FontWeight.w400,
                            color: AppColors.greyTextColor,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              AddText(
                                data: dateMonthFormat.format(startDate),
                                textSize: 16,
                                textWeight: FontWeight.w600,
                              ),
                              Expanded(child: Container()),
                              Image.asset(
                                AssetImages.calenderIcon,
                                height: 17,
                                width: 17,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: MySize.size10,
                            ),
                            child: const Divider(
                              thickness: 1,
                              height: 1,
                              color: AppColors.greyDivider,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddText(
                            data: 'Period',
                            textSize: 12,
                            textWeight: FontWeight.w400,
                            color: AppColors.greyTextColor,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              AddText(
                                data: dateMonthFormat.format(
                                    endDate), ///////////////////////////
                                textSize: 16,
                                textWeight: FontWeight.w600,
                              ),
                              Expanded(child: Container()),
                              Image.asset(
                                AssetImages.calenderIcon,
                                height: 17,
                                width: 17,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: MySize.size10,
                            ),
                            child: const Divider(
                              thickness: 1,
                              height: 1,
                              color: AppColors.greyDivider,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddText(
                            data: 'Total fees',
                            textSize: 12,
                            textWeight: FontWeight.w400,
                            color: AppColors.greyTextColor,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AddText(
                            data: widget.totalFee.toString(), //// Total Fee
                            textSize: 16,
                            textWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: MySize.size10,
                            ),
                            child: const Divider(
                              thickness: 1,
                              height: 1,
                              color: AppColors.greyDivider,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      ButtonSuffixIcon(
                        width: width,
                        height: 54,
                        data: 'Pay Now',
                        textSize: 16,
                        textWeight: FontWeight.w600,
                        onTap: () {},
                        gradientColor1: AppColors.appGradient2,
                        gradientColor2: AppColors.appGradient1,
                        iconWidthForTextCenter: 17,
                        buttonSuffixIcon: SvgPicture.asset(
                            height: 18,
                            width: 27.5,
                            AssetImages.rightSignInArrow),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
