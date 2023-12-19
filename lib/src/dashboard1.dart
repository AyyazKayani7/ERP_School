import 'package:erp_school/src/utilities/mySize.dart';
import 'package:flutter/material.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'widgets/addText.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({super.key});

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
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
            height: height,
            width: width,
            decoration: const BoxDecoration(
              //color: Colors.amber
              gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2]),
            ),
            child: Stack(
              children: [
                //// Positioned 1    Star Pattern on Bckground
                Positioned(
                  top: height * 0.20,
                  left: width * 0.03,
                  child: Container(
                    width: width * 0.97,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(AssetImages.starPatternDashboard))),
                    child: Image.asset(AssetImages.starPatternDashboard),
                  ),
                ),
                //// Positioned 2    Profile Information
                Positioned(
                  left: width * 0.05,
                  child: SizedBox(
                    height: height * 0.5,
                    width: width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.085,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color:
                                            const Color.fromARGB(255, 197, 197, 197),
                                        textSize: 18,
                                      ),
                                      AddText(
                                        data: ' | Roll No: 04',
                                        color:
                                            const Color.fromARGB(255, 197, 197, 197),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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
                              Container(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //// Positioned 3    Big White Container
                Positioned(
                  top: height * 0.36,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    width: width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.17,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                width: width * 0.04,
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
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                width: width * 0.04,
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
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                width: width * 0.04,
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
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                width: width * 0.04,
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
                        ],
                      ),
                    ),
                  ),
                ),
                ////Positioned 4     Upper Two Containers
                Positioned(
                  top: MySize.size200, //height * 0.25,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.038),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.44,
                          height: height * 0.26,
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
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Container(
                          width: width * 0.44,
                          height: height * 0.26,
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
                        )
                      ],
                    ),
                  ),
                ),
                //Expanded(child: Container())
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
