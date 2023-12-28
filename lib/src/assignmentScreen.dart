import 'package:erp_school/src/model/assignment.dart';
import 'package:erp_school/src/widgets/addButton.dart';
import 'package:erp_school/src/widgets/addTextBackgroundColor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Assignment a = Assignment();
    Assignment a1 = Assignment();
    Assignment a2 = Assignment();
    a.title = "Surface Areas and Volumes";
    a.assignDate = DateTime(20, 11, 10);
    a.submissionDate = DateTime(20, 12, 10);
    a.status = 0;
    a.course = 'Mathematics';
    //
    a1.title = "Structure of Atoms";
    a1.assignDate = DateTime(20, 10, 10);
    a1.submissionDate = DateTime(20, 10, 30);
    a1.status = 0;
    a1.course = 'Science';
    //
    a2.title = "My Bestfriend Essay";
    a2.assignDate = DateTime(20, 9, 10);
    a2.submissionDate = DateTime(20, 9, 30);
    a2.status = 1;
    a2.course = 'English';

    List<Assignment> aList = [];
    aList.add(a);
    aList.add(a1);
    aList.add(a2);
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
                      data: 'Assignment',
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
            child: ListView.builder(
                itemCount: aList.length,
                itemBuilder: (context, index) {
                  Assignment ad = Assignment();
                  ad = aList[index];
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 11, top: 11, right: 11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: AppColors.buttonCenterIconColor
                                      .withOpacity(0.2),
                                ),
                                child: AddTextBackColor(
                                  textWeight: FontWeight.w600,
                                  data: ad.course.toString(),
                                  color: AppColors.buttonCenterIconColor,
                                  backgroundColor: AppColors
                                      .buttonCenterIconColor
                                      .withOpacity(0.05),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AddText(
                                data: ad.title.toString(),
                                textWeight: FontWeight.w600,
                                textSize: 14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AddText(
                                    data: 'Assign Date',
                                    textWeight: FontWeight.w400,
                                    textSize: 14,
                                    color: AppColors.greyTextColor,
                                  ),
                                  AddText(
                                    data:
                                        dateMonthFormat.format(ad.assignDate!),
                                    textWeight: FontWeight.w600,
                                    textSize: 14,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AddText(
                                    data: 'Submission Date',
                                    textWeight: FontWeight.w400,
                                    textSize: 14,
                                    color: AppColors.greyTextColor,
                                  ),
                                  AddText(
                                    data: dateMonthFormat
                                        .format(ad.submissionDate!),
                                    textWeight: FontWeight.w600,
                                    textSize: 14,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              ad.status == 0
                                  ? AddButton(
                                      gradientColor1: AppColors.appGradient2,
                                      gradientColor2: AppColors.appGradient1,
                                      width: width,
                                      data: 'To Be Submitted',
                                      onTap: () {},
                                    )
                                  : Container(),
                              const SizedBox(
                                height: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                }),
          ),
        )),
      ]),
    );
  }
}
