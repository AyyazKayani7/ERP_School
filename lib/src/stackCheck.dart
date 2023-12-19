import 'package:erp_school/src/attendance.dart';
import 'package:erp_school/src/feesDue.dart';
import 'package:erp_school/src/profile.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:flutter/material.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'widgets/addText.dart';

class StackCheck extends StatefulWidget {
  const StackCheck({super.key});

  @override
  State<StackCheck> createState() => _StackCheckState();
}

class _StackCheckState extends State<StackCheck> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double circleDiameter = width < height ? width * 0.22 : height * 0.3;
    MySize().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MySize.size230,
            width: width,
            decoration: const BoxDecoration(
              //color: Colors.amber
              gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2]),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: SizedBox(
                    width: width * 0.8,
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: width * 0.2, vertical: height * 0.02),
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image:
                    //             AssetImage(AssetImages.starPatternDashboard))
                    //             ),
                    child: Image.asset(AssetImages.starPatternDashboard),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AddText(
                                height: 40,
                                data: 'Hi Akshay',
                                color: Colors.white,
                                textSize: 30,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  AddText(
                                    data: 'Class XI-B',
                                    color: const Color.fromARGB(
                                        255, 197, 197, 197),
                                    textSize: 18,
                                  ),
                                  AddText(
                                    data: ' | Roll No: 04',
                                    color: const Color.fromARGB(
                                        255, 197, 197, 197),
                                    textSize: 18,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 25,
                                width: 110,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        AddText(
                                          data: '2020',
                                          color: AppColors.blueShade,
                                        ),
                                        AddText(
                                            data: '-2021',
                                            color: AppColors.blueShade),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Profile()));
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  )),
                              child: Center(
                                child: Container(
                                  // padding: const EdgeInsets.all(10),
                                  height: 61,
                                  width: 61,
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MySize.size80,
                    width: width,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          //side: BorderSide(color: AppColors.appGradient1)
                          ),
                      shadows: [
                        BoxShadow(
                          color: AppColors.appGradient1,
                        ),
                        BoxShadow(color: AppColors.appGradient2),
                      ],
                      gradient: LinearGradient(colors: [
                        AppColors.appGradient1,
                        AppColors.appGradient2
                      ]),
                    ),
                  ),
                  Container(
                    // height: MySize.size70,
                    width: width,
                    decoration: const BoxDecoration(
                      // color: Colors.amber,
                      gradient: LinearGradient(colors: [
                        AppColors.appGradient1,
                        AppColors.appGradient2
                      ]),
                    ),
                    child: Container(
                      width: width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                        // gradient: LinearGradient(
                        //     colors: [AppColors.appGradient1, AppColors.appGradient2]),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MySize.size140,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.playQuiz),
                                        AddText(
                                          data: 'Play Quiz',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.assignment),
                                        AddText(
                                          data: 'Assignment',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size32,
                                            width: MySize.size56,
                                            AssetImages.schoolHolidays),
                                        AddText(
                                          data: 'School Holidays',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.timeTable),
                                        AddText(
                                          data: 'Time Table',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size32,
                                            width: MySize.size56,
                                            AssetImages.result),
                                        AddText(
                                          data: 'Result',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.dateSheet),
                                        AddText(
                                          data: 'Date Sheet',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size32,
                                            width: MySize.size56,
                                            AssetImages.askDoubts),
                                        AddText(
                                          data: 'Ask Doubts',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.schoolGallery),
                                        AddText(
                                          data: 'School Gallery',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size32,
                                            width: MySize.size56,
                                            AssetImages.leaveApplication),
                                        AddText(
                                          data: 'Leave Application',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.changePassword),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AddText(
                                            data: 'Change Password',
                                            textSize: MySize.size18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size32,
                                            width: MySize.size56,
                                            AssetImages.events),
                                        AddText(
                                          data: 'Events',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.greyShade1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 132,
                                  //width: 163,
                                  width: width * 0.43,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: MySize.size40,
                                            width: MySize.size40,
                                            AssetImages.logout),
                                        AddText(
                                          data: 'Logout',
                                          textSize: MySize.size18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Attendance()));
                      },
                      child: Container(
                        width: MySize.size160,
                        height: MySize.size200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: AppColors.appGradient2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MySize.size15, //width * 0.04,
                            vertical: MySize
                                .size15, //height * 0.02, //MySize.size, //
                            //top: width * 0.03, left: width * 0.03
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: MySize.size72, //circleDiameter,
                                width: MySize.size72, //circleDiameter,
                                decoration: const BoxDecoration(
                                    color: AppColors.yellowish,
                                    // borderRadius:
                                    //     BorderRadius.all(Radius.circular(100))
                                    shape: BoxShape.circle),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Center(
                                    child: Image.asset(
                                        height: MySize.size42,
                                        width: MySize.size42,
                                        AssetImages.student),
                                  ),
                                ),
                              ),
                              AddText(
                                data: '80.39%',
                                textWeight: FontWeight.bold,
                                textSize: MySize.size35,
                              ),
                              AddText(
                                  data: 'Attendance',
                                  color: AppColors.grey1,
                                  textSize: MySize.size18 //18,
                                  )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeesDue()));
                      },
                      child: Container(
                        width: MySize.size160,
                        height: MySize.size200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.appGradient2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MySize.size15, //width * 0.03,
                              left: MySize.size15
                              // width * 0.03
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: MySize.size72, //circleDiameter,
                                width: MySize.size72, //,circleDiameter,
                                decoration: const BoxDecoration(
                                    color: AppColors.lightPurple1,
                                    // borderRadius:
                                    //     BorderRadius.all(Radius.circular(100)),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(
                                      height: MySize.size42,
                                      width: MySize.size42,
                                      AssetImages.moneySymbol),
                                ),
                              ),
                              AddText(
                                data: '6400',
                                textWeight: FontWeight.bold,
                                textSize: MySize.size35,
                              ),
                              AddText(
                                  data: 'Fees Due',
                                  color: AppColors.grey1,
                                  textSize: MySize.size18 //18,
                                  )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
