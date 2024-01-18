import 'package:erp_school/src/controller/studentController.dart';
import 'package:erp_school/src/payOnline.dart';
import 'package:erp_school/src/widgets/buttonCenterIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'model/fee.dart';
import 'model/fees.dart';
import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class FeesDue extends StatefulWidget {
  const FeesDue({super.key});

  @override
  State<FeesDue> createState() => _FeesDueState();
}

class _FeesDueState extends State<FeesDue> {
  bool isDataLoaded = false;
  List<Fees> flist = [];
  getFees() async {
    StudentController s = StudentController();
    flist = await s.getFees();
    if (flist.isNotEmpty) {
      isDataLoaded = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFees();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Fee f = Fee();
    Fee f1 = Fee();
    Fee f2 = Fee();
    f.receiptNo = "#98761";
    f.paymentDate = DateTime(20, 10, 10);
    f.status = 0;
    f.totalAmount = 999;
    f1.receiptNo = "#98431";
    f1.paymentDate = DateTime(20, 9, 10);
    f1.status = 1;
    f1.totalAmount = 999;
    f2.receiptNo = "#98765";
    f2.paymentDate = DateTime(20, 8, 10);
    f2.status = 1;
    f2.totalAmount = 999;

    List<Fee> fList = [];
    fList.add(f);
    fList.add(f1);
    fList.add(f2);
    final dateMonthFormat = DateFormat('dd MMM yy');
    var monthFormat = DateFormat('MMMM');
    //fList.add(f);

    //f.receiptNo = 'skhdfkjbv';
    return Scaffold(
      body: Column(children: [
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
                padding: EdgeInsets.only(left: width * 0.1, top: height * 0.1),
                child: Image.asset(
                    height: height * 0.2,
                    width: width * 0.8,
                    AssetImages.starPatternDashboard),
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: MySize.size18
              //       // left: width * 0.05,
              //       // right: width * 0.05,
              //       // top: MySize.size20,
              //       ),
              //   child:
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
                        data: 'Fees Due',
                        color: Colors.white,
                        textSize: MySize.size20,
                      ),
                      Expanded(child: Container()),
                      // Container(
                      //   height: MySize.size28,
                      //   width: MySize.size84,
                      //   decoration: const BoxDecoration(
                      //       //border: Border.all(width: 1),
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.all(Radius.circular(100))),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //           width: MySize.size12,
                      //           height: MySize.size20,
                      //           AssetImages.checkedIcon),
                      //       const SizedBox(
                      //         width: 5,
                      //       ),
                      //       AddText(
                      //         data: 'Done',
                      //         color: AppColors.purpleBlue,
                      //         textSize: 13,
                      //         textWeight: FontWeight.w700,
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              //),
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              //color: Colors.amber
              gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2])),
          child: Container(
            width: width,
            //color: Colors.green,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: !isDataLoaded
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: flist.length,
                    itemBuilder: (context, index) {
                      Fees fd = Fees();
                      fd = flist[index];
                      String d = monthFormat.format(fd.paymentDate!);
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                  width: 1, color: AppColors.greyDivider),
                            ),
                            margin: EdgeInsets.only(
                              // top: MySize.size16,
                              left: MySize.size16,
                              right: MySize.size16,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, top: 11, right: 11),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AddText(
                                        data: 'Receipt No.',
                                        textWeight: FontWeight.w400,
                                        textSize: 14,
                                        color: AppColors.greyTextColor,
                                      ),
                                      AddText(
                                        data: fd.receiptNo!,
                                        textWeight: FontWeight.w600,
                                        textSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, top: 11, right: 11),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: MySize.size10,
                                    ),
                                    child: const Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: AppColors.greyDivider,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, top: 14, right: 11),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AddText(
                                        data: 'Month',
                                        textWeight: FontWeight.w400,
                                        textSize: 14,
                                        color: AppColors.greyTextColor,
                                      ),
                                      AddText(
                                        data: d,
                                        textWeight: FontWeight.w600,
                                        textSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 14,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, top: 14, right: 11),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AddText(
                                        data: 'Payment Date',
                                        textWeight: FontWeight.w400,
                                        textSize: 14,
                                        color: AppColors.greyTextColor,
                                      ),
                                      AddText(
                                        data: dateMonthFormat
                                            .format(fd.paymentDate!),
                                        textWeight: FontWeight.w600,
                                        textSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                fd.status == 1
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 11, top: 14, right: 11),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AddText(
                                              data: 'Pay Mode',
                                              textWeight: FontWeight.w400,
                                              textSize: 14,
                                              color: AppColors.greyTextColor,
                                            ),
                                            AddText(
                                              data: "Cash on Counter",
                                              textWeight: FontWeight.w600,
                                              textSize: 14,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, top: 14, right: 11),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: MySize.size10,
                                    ),
                                    child: const Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: AppColors.greyDivider,
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11, top: 11, right: 11),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AddText(
                                        data: 'Total Pending Amount',
                                        textWeight: FontWeight.w400,
                                        textSize: 14,
                                        color: AppColors.greyTextColor,
                                      ),
                                      AddText(
                                        data: fd.amount.toString(),
                                        textWeight: FontWeight.w600,
                                        textSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ButtonCenterIcon(
                                  height: 45,
                                  textWeight: FontWeight.w600,
                                  textSize: 14,
                                  gradientColor1:
                                      AppColors.buttonCenterIconColor,
                                  gradientColor2:
                                      AppColors.buttonCenterIconColor,
                                  width: width,
                                  iconWidthForTextCenter: 25,
                                  bottomLeftRadius: 15,
                                  bottomRightRadius: 15,
                                  buttonSuffixIcon: SvgPicture.asset(
                                      height: 12.5,
                                      width: 17,
                                      fd.status == 1
                                          ? AssetImages.downloadIcon
                                          : AssetImages.rightSignInArrow),
                                  data: fd.status == 1 ? "Download" : 'Pay Now',
                                  onTap: fd.status == 1
                                      ? () {
                                          //// Fee Paid Logic
                                        }
                                      : () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PayOnline(
                                                        dateOfFee:
                                                            fd.paymentDate!,
                                                        totalFee: int.parse(
                                                            fd.amount!),
                                                      )));
                                          //// Fee Due Logic
                                        },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // index == fList.length - 1
                          //     ? const SizedBox(
                          //         height: 16,
                          //       )
                          //     : Container()
                        ],
                      );
                    }),
          ),
        )),
      ]),
    );
  }
}
