import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:erp_school/src/widgets/addText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'utilities/colors.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
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
                      EdgeInsets.only(left: MySize.size30, top: MySize.size100),
                  child: Image.asset(
                      height: height * 0.2,
                      width: width * 0.8,
                      AssetImages.starPatternHalf),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: MySize.size18
                //       // left: width * 0.05,
                //       // right: width * 0.05,
                //       // top: MySize.size20,
                //       ),
                //   child:
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MySize.size18),
                  width: MySize.size360,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                            width: MySize.size12,
                            height: MySize.size20,
                            AssetImages.backIconWhite),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      AddText(
                        data: 'My Profile',
                        color: Colors.white,
                        textSize: MySize.size20,
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: MySize.size28,
                        width: MySize.size84,
                        decoration: const BoxDecoration(
                            //border: Border.all(width: 1),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                width: MySize.size12,
                                height: MySize.size20,
                                AssetImages.checkedIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            AddText(
                              data: 'Done',
                              color: AppColors.purpleBlue,
                              textSize: 13,
                              textWeight: FontWeight.w700,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: const BoxDecoration(
                //color: Colors.amber
                gradient: LinearGradient(
                    colors: [AppColors.appGradient1, AppColors.appGradient2]),
              ),
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //// Student Name & Image
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                        padding: EdgeInsets.all(MySize.size15),
                        height: MySize.size100,
                        width: width * 0.9, // MySize.size340, //width * 0.9,

                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.blueBorder,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   height: MySize.size75,
                            //   width: MySize.size75,
                            //   decoration: const BoxDecoration(
                            //       color: AppColors.greyShade,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15))),
                            // ),
                            SizedBox(
                              width: MySize.size10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddText(
                                  data: 'Akshay Syal',
                                  textSize: MySize.size20,
                                  textWeight: FontWeight.w700,
                                ),
                                SizedBox(
                                  height: MySize.size10,
                                ),
                                Row(
                                  children: [
                                    AddText(
                                      data: 'Class VI-B ',
                                      color: AppColors.grey1,
                                      textWeight: FontWeight.w400,
                                    ),
                                    AddText(
                                      data: '| Roll No: 04',
                                      color: AppColors.grey1,
                                      textWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                  AppColors.grey7777, BlendMode.srcIn),
                              child: SvgPicture.asset(AssetImages.cameraIcon),
                            ),
                          ],
                        ),
                      ),
                      //// Student Profile Details
                      //// Row 1 Container
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.05,
                            right: width * 0.05,
                            bottom: MySize.size18,
                            top: MySize.size12),
                        //padding: EdgeInsets.all(MySize.size15),
                        width: width * 0.9, //MySize.size340,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Adhar No',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                AddText(
                                  data: '1234 4325 4567 1234',
                                  textSize: MySize.size16,
                                  textWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MySize.size20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Academic Year',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                AddText(
                                  data: '2020-2021',
                                  textSize: MySize.size16,
                                  textWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      //// Row 2 Container
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size18,
                            right: MySize.size18,
                            bottom: MySize.size18,
                            top: MySize.size12),
                        //padding: EdgeInsets.all(MySize.size15),
                        width: MySize.size340, //width * 0.9,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Admision Class',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: 'VI',
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MySize.size20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Old Admision No',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: 'T00221',
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ), //// Row 3 Container
                      //// Row 3 Container
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size18,
                            right: MySize.size18,
                            bottom: MySize.size18,
                            top: MySize.size12),
                        //padding: EdgeInsets.all(MySize.size15),
                        width: MySize.size340, //width * 0.9,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Date of Admission',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: '01 Apr 2018',
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MySize.size20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Date of Birth',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: '22 July 1996',
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      //// Row 4 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: MySize.size18,
                              right: MySize.size18,
                              bottom: MySize.size18,
                              top: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: MySize.size340, //width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Parent Mail ID',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: 'parentboth84@gmail.com',
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                      //// Row 5 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: MySize.size18,
                              right: MySize.size18,
                              bottom: MySize.size18,
                              top: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: MySize.size340, //width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Mother Name',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: 'Monica Larson',
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                      //// Row 5 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: MySize.size18,
                              right: MySize.size18,
                              bottom: MySize.size18,
                              top: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: MySize.size340, //width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Father Name',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: 'Bernard Tylor',
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                      //// Row 5 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: MySize.size18,
                              right: MySize.size18,
                              bottom: MySize.size18,
                              top: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: MySize.size340, //width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Permanent Add',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: 'Karol Bagh, Dehli',
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: MySize.size340,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
