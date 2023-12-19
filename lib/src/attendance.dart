import 'package:erp_school/src/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'utilities/asset_images.dart';
import 'utilities/mySize.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        TabBar(
                          tabs: [
                            Container(
                              height: 100,
                              width: 100,
                              color: Colors.amber,
                              child: const Text('ABC'),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              color: Colors.green,
                              child: const Text('ABC'),
                            )
                          ],
                        )
                        // Container(
                        //   height: MySize.size28,
                        //   width: MySize.size84,
                        //   decoration: const BoxDecoration(
                        //       //border: Border.all(width: 1),
                        //       color: Colors.white,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(100))),
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
                  //),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
