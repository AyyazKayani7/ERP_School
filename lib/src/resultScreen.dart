import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp_school/src/model/course.dart';
import 'package:erp_school/src/model/student.dart';
import 'package:erp_school/src/provider/resultProvider.dart';
import 'package:erp_school/src/utilities/fonts.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:erp_school/src/widgets/addButton.dart';
import 'package:erp_school/src/widgets/buttonCenterIcon.dart';
import 'package:erp_school/src/widgets/buttonSuffixIcon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/result.dart';
import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'widgets/addText.dart';

class ResultScreen extends StatefulWidget {
  Student student;
  ResultScreen({super.key, required this.student});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Result stdResult = Result(
    englishTotal: 100,
    englishObtained: 85,
    hindiTotal: 100,
    hindiObtained: 90,
    scienceTotal: 100,
    scienceObtained: 75,
    mathTotal: 100,
    mathObtained: 95,
    socialStudyTotal: 100,
    socialStudyObtained: 80,
    drawingTotal: 100,
    drawingObtained: 70,
    computerTotal: 100,
    computerObtained: 100,
  );
  //Student std = Student('Ali', 30, stdResult);
  //Student std = Student.setValues('Ali', 30, stdResult!);

  // Convert Result object to JSON
  //Map<String, dynamic> resultJson = studentResult.toJson();
  //print(resultJson);
  @override
  void initState() {
    // TODO: implement initState
    ResultProvider resultProvider =
        Provider.of<ResultProvider>(context, listen: false);

    // resultProvider.setGrade(
    //     //value.grade +
    //     'A');
    // resultProvider.setPercentage(
    //     // value.percentage +
    //     85);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //ResultProvider resultProvider = Provider.of<ResultProvider>(context);
    // resultProvider.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    User user = FirebaseAuth.instance.currentUser!;
    late Map<String, dynamic> resultData;

    ResultProvider resultProvider =
        Provider.of<ResultProvider>(context, listen: false);
    int totalMarks = 0;
    int obtainedMarks = 0;
    String grade = 'Grade ';
    bool a = true;
    return Scaffold(
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MySize.size283,
              //height * 0.45
            ),
            //flex: 4,
            child: Column(
              children: [
                Container(
                  //height: MySize.size10,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.appGradient1,
                      AppColors.appGradient2
                    ]),
                  ),
                ),
                Container(
                  //height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    //color: Colors.amber
                    gradient: LinearGradient(colors: [
                      AppColors.appGradient1,
                      AppColors.appGradient2
                    ]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250, //height * 0.35,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                height: 220,
                                width: width,
                                fit: BoxFit.fill,
                                AssetImages.upperBackGroundPercentageScreen,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 124,
                                  height: 124,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            AssetImages.circleDesignForGrades,
                                          ),
                                          fit: BoxFit.fill)),
                                  child: Consumer<ResultProvider>(
                                    builder: (context, value, child) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AddText(
                                          data:
                                              '${value.percentage.round()}%' ??
                                                  ''
                                          //  +
                                          //     ' 85%'
                                          ,
                                          textSize: 38,
                                          textWeight: FontWeight.w600,
                                          fontFamily: Fonts.bebasNeue,
                                        ),
                                        AddText(
                                          // data: 'Grade A',
                                          data: value.grade ?? ''
                                          //  + grade
                                          ,
                                          textSize: 15,
                                          textWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  )
                                  // Image.asset(
                                  //   AssetImages.circleDesignForGrades,
                                  //   height: 124,
                                  //   width: 124,
                                  // ),
                                  ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 100, color: Colors.white),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        topRight: Radius.circular(100))),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: width * 0.04, top: 40),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        AssetImages.backIconWhite,
                                        height: 20,
                                        width: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.85,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        AssetImages.shareIcon,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   constraints: BoxConstraints(
          //     maxHeight:
          //     //MySize.size360,
          //     //height * 0.45
          //   ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<ResultProvider>(
                    builder: (context, value, child) => AddText(
                      data:
                          // resultProvider.remarks == ''
                          //     ? ''
                          //     :
                          value.remarks, //'You are Excellent,',
                      textSize: 15,
                      textWeight: FontWeight.w600,
                    ),
                  ),
                  AddText(
                    data: '${widget.student.name}!!',
                    textSize: 30,
                    textWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    width: 1, color: AppColors.greyDivider)),
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Student')
                                  .doc(user.uid)
                                  .collection('Result')
                                  .doc('2022')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  resultData = snapshot.data!.data()!;

                                  // print(resultData.toString());
                                  // Course c =
                                  //     Course.fromJson(resultData['Drawing']
                                  //Map.fromEntries([entry])
                                  // entry as Map<String, dynamic>
                                  // );
                                  // print(c.totalMarks);
                                  // return Consumer<ResultProvider>(
                                  //   builder: (context, value, child) => Column(
                                  //     children: [
                                  //       ListView.builder(
                                  //           itemCount: map.length,
                                  //           // physics: NeverScrollableScrollPhysics(),
                                  //           shrinkWrap: true,
                                  //           itemBuilder: (context, index) {
                                  //             String key =
                                  //                 map.keys.elementAt(index);
                                  //             Course c = Course.fromJson(
                                  //                 map[key] as Map<String, dynamic>);
                                  //             value.setGrade(value.grade + 'AA');
                                  //             value.setPercentage(
                                  //                 value.percentage + 85);
                                  //             // totalMarks =
                                  //             //     c.totalMarks! + totalMarks;
                                  //             // obtainedMarks =
                                  //             //     c.obtainedMarks! + obtainedMarks;
                                  //             grade = '${grade}AA';
                                  //             print(map.entries.last.toString() +
                                  //                 'jkhgsjhb' +
                                  //                 map.toString());
                                  //             if (map == map.entries.last) {
                                  //               grade = '${grade}AA';
                                  //             }

                                  //             debugPrint(c.toString());
                                  //             return Row(
                                  //               children: [
                                  //                 Container(
                                  //                     padding:
                                  //                         const EdgeInsets.only(
                                  //                       left: 10.0,
                                  //                       top: 14,
                                  //                     ),
                                  //                     child: AddText(
                                  //                         data: c.courseName
                                  //                             .toString())),
                                  //                 Expanded(child: Container()),
                                  //                 Container(
                                  //                   width: MySize.size90,
                                  //                   padding: const EdgeInsets.only(
                                  //                     right: 10.0,
                                  //                     top: 14,
                                  //                   ),
                                  //                   decoration: const BoxDecoration(
                                  //                       color: AppColors
                                  //                           .blueBgResultCard),
                                  //                   child: AddText(
                                  //                     data: c.totalMarks.toString(),
                                  //                     color: AppColors.marksColor,
                                  //                   ),
                                  //                 ),
                                  //                 Container(
                                  //                   width: MySize.size90,
                                  //                   padding: const EdgeInsets.only(
                                  //                     right: 10.0,
                                  //                     top: 14,
                                  //                   ),
                                  //                   decoration: BoxDecoration(
                                  //                       borderRadius: index ==
                                  //                               map.length
                                  //                           ? const BorderRadius
                                  //                               .only(
                                  //                               topRight:
                                  //                                   Radius.circular(
                                  //                                       20),
                                  //                             )
                                  //                           : const BorderRadius
                                  //                               .only(
                                  //                               bottomRight:
                                  //                                   Radius.circular(
                                  //                                       20),
                                  //                             ),
                                  //                       color: const Color.fromARGB(
                                  //                           255, 216, 251, 220)),
                                  //                   child: AddText(
                                  //                     data: c.obtainedMarks
                                  //                         .toString(),
                                  //                     color: AppColors.marksColor,
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             );
                                  //           }),
                                  //       SizedBox(
                                  //         height: 25,
                                  //       )
                                  //     ],
                                  //   ),
                                  // );
                                  return Column(
                                    children: [
                                      Column(
                                        children: resultData.entries.map(
                                            (MapEntry<String, dynamic> entry) {
                                          // debugPrint(
                                          //     Map.fromEntries([entry]).toString());
                                          Course c = Course.fromJson(entry.value
                                              //Map.fromEntries([entry])
                                              // entry as Map<String, dynamic>
                                              );
                                          // Set the value in the provider using Future.delayed
                                          Future.delayed(Duration.zero, () {
                                            // SchedulerBinding.instance!.addPostFrameCallback is used to ensure
                                            // that this runs after the current frame is drawn
                                            SchedulerBinding.instance!
                                                .addPostFrameCallback((_) {
                                              totalMarks =
                                                  c.totalMarks! + totalMarks;
                                              obtainedMarks = c.obtainedMarks! +
                                                  obtainedMarks;

                                              // Update the provider value here
                                              resultProvider.setPercentage(
                                                  (obtainedMarks /
                                                      totalMarks *
                                                      100));
                                              if (resultProvider.percentage >=
                                                      75 &&
                                                  resultProvider.percentage <=
                                                      100) {
                                                resultProvider.setGrade(
                                                    //value.grade +
                                                    'Grade A');
                                                resultProvider.setRemarks(
                                                    'You are Excellent,');
                                              } else if (resultProvider
                                                          .percentage >=
                                                      65 &&
                                                  resultProvider.percentage <
                                                      75) {
                                                resultProvider.setGrade(
                                                    //value.grade +
                                                    'Grade B');
                                                resultProvider.setRemarks(
                                                    'You are Good,');
                                              } else if (resultProvider
                                                          .percentage >=
                                                      50 &&
                                                  resultProvider.percentage <
                                                      65) {
                                                resultProvider.setGrade(
                                                    //value.grade +
                                                    'Grade C');
                                                resultProvider.setRemarks(
                                                    'You are Average,');
                                              } else if (resultProvider
                                                          .percentage >=
                                                      35 &&
                                                  resultProvider.percentage <
                                                      50) {
                                                resultProvider.setGrade(
                                                    //value.grade +
                                                    'Grade D');
                                                resultProvider.setRemarks(
                                                    'You are Below Average,');
                                              } else {
                                                resultProvider.setGrade(
                                                    //value.grade +
                                                    'Grade F');
                                                resultProvider.setRemarks(
                                                    'You are Fail,');
                                              }
                                            });
                                          });
                                          // Provider.of<ResultProvider>(context,
                                          //         listen: false)
                                          //     .setGrade(
                                          //         //value.grade +
                                          //         'A');
                                          // Provider.of<ResultProvider>(context,
                                          //         listen: false)
                                          //     .setPercentage(
                                          //         // value.percentage +
                                          //         85);
                                          // resultProvider.setGrade(
                                          //     //value.grade +
                                          //     'A');
                                          // resultProvider.setPercentage(
                                          //     // value.percentage +
                                          //     85);
                                          // totalMarks = c.totalMarks! + totalMarks;
                                          // obtainedMarks =
                                          //     c.obtainedMarks! + obtainedMarks;

                                          debugPrint(c.toString());
                                          // String key = entry.key;
                                          // dynamic value = entry.value;

                                          // Replace the return statement with the widget you want to create based on the key-value pair
                                          return Row(
                                            children: [
                                              Container(
                                                  height: entry.value ==
                                                          resultData.entries
                                                              .last.value
                                                      ? MySize.size55
                                                      : MySize.size40,
                                                  padding: entry.value ==
                                                          resultData.entries
                                                              .last.value
                                                      ? const EdgeInsets.only(
                                                          left: 15.0,
                                                          top: 15,
                                                          bottom: 10)
                                                      : const EdgeInsets.only(
                                                          left: 15.0, top: 15),
                                                  child: AddText(
                                                      data: c.courseName
                                                          .toString())),
                                              Expanded(child: Container()),
                                              Container(
                                                height: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? MySize.size55
                                                    : MySize.size40,
                                                width: MySize.size90,
                                                padding: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? const EdgeInsets.only(
                                                        right: 10.0,
                                                        top: 15,
                                                        bottom: 10)
                                                    : const EdgeInsets.only(
                                                        right: 10.0, top: 15),
                                                decoration: BoxDecoration(
                                                    borderRadius: entry.value ==
                                                            resultData.entries
                                                                .last.value
                                                        ? const BorderRadius
                                                            .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20),
                                                          )
                                                        : entry.value ==
                                                                resultData
                                                                    .entries
                                                                    .first
                                                                    .value
                                                            ? const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                              )
                                                            : const BorderRadius
                                                                .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                    color: AppColors
                                                        .blueBgResultCard),
                                                child: Center(
                                                  child: AddText(
                                                    data:
                                                        c.totalMarks.toString(),
                                                    color: AppColors.marksColor,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MySize.size90,
                                                height: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? MySize.size55
                                                    : MySize.size40,
                                                padding: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? const EdgeInsets.only(
                                                        right: 10.0,
                                                        top: 15,
                                                        bottom: 10)
                                                    : const EdgeInsets.only(
                                                        right: 10.0, top: 15),
                                                decoration: BoxDecoration(
                                                    borderRadius: entry.value ==
                                                            resultData.entries
                                                                .last.value
                                                        ? const BorderRadius
                                                            .only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                          )
                                                        : entry.value ==
                                                                resultData
                                                                    .entries
                                                                    .first
                                                                    .value
                                                            ? const BorderRadius
                                                                .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20),
                                                              )
                                                            : const BorderRadius
                                                                .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                    color: const Color.fromARGB(
                                                        255, 216, 251, 220)),
                                                child: Center(
                                                  child: AddText(
                                                    data: c.obtainedMarks
                                                        .toString(),
                                                    color: AppColors.marksColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  );
                                }

                                // if (snapshot.hasData) {
                                //   Map<String, dynamic> map = snapshot.data!.data()!;
                                //   map.forEach((key, value) {
                                //     Row(
                                //       children: [
                                //         Container(
                                //             padding: const EdgeInsets.only(
                                //               left: 10.0,
                                //               top: 14,
                                //             ),
                                //             child: AddText(data: 'English')),
                                //         Expanded(child: Container()),
                                //         Container(
                                //           width: MySize.size90,
                                //           padding: const EdgeInsets.only(
                                //             right: 10.0,
                                //             top: 14,
                                //           ),
                                //           decoration: const BoxDecoration(
                                //               color: AppColors.blueBgResultCard),
                                //           child: AddText(
                                //             data: stdResult.englishTotal.toString(),
                                //             color: AppColors.marksColor,
                                //           ),
                                //         ),
                                //         Container(
                                //           width: MySize.size90,
                                //           padding: const EdgeInsets.only(
                                //             right: 10.0,
                                //             top: 14,
                                //           ),
                                //           decoration: const BoxDecoration(
                                //               borderRadius: BorderRadius.only(
                                //                 topRight: Radius.circular(20),
                                //               ),
                                //               color: Color.fromARGB(
                                //                   255, 216, 251, 220)),
                                //           child: AddText(
                                //             data: stdResult.englishObtained
                                //                 .toString(),
                                //             color: AppColors.marksColor,
                                //           ),
                                //         ),
                                //       ],
                                //     );
                                //   });
                                // }
                                else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                            // Column(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 14,
                            //             ),
                            //             child: AddText(data: 'English')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 14,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.englishTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 14,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               borderRadius: BorderRadius.only(
                            //                 topRight: Radius.circular(20),
                            //               ),
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.englishObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Hindi')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.hindiTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.hindiObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Hindi')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.hindiTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.hindiObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Hindi')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.hindiTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.hindiObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Science')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.scienceTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.scienceObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Math')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.mathTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.mathObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Social Study')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.socialStudyTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data:
                            //                 stdResult.socialStudyObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Social Study')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.socialStudyTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data:
                            //                 stdResult.socialStudyObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Social Study')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.socialStudyTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data:
                            //                 stdResult.socialStudyObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //               left: 10.0,
                            //               top: 10,
                            //             ),
                            //             child: AddText(data: 'Drawing')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.drawingTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //             right: 10.0,
                            //             top: 10,
                            //           ),
                            //           decoration: const BoxDecoration(
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.drawingObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //             padding: const EdgeInsets.only(
                            //                 left: 10.0, top: 10, bottom: 14),
                            //             child: AddText(data: 'Computer')),
                            //         Expanded(child: Container()),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //               right: 10.0, top: 10, bottom: 14),
                            //           decoration: const BoxDecoration(
                            //               color: AppColors.blueBgResultCard),
                            //           child: AddText(
                            //             data: stdResult.computerTotal.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MySize.size90,
                            //           padding: const EdgeInsets.only(
                            //               right: 10.0, top: 10, bottom: 14),
                            //           decoration: const BoxDecoration(
                            //               borderRadius: BorderRadius.only(
                            //                   bottomRight: Radius.circular(20)),
                            //               color: Color.fromARGB(255, 216, 251, 220)),
                            //           child: AddText(
                            //             data: stdResult.computerObtained.toString(),
                            //             color: AppColors.marksColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),

                            ),
                      ),
                    ],
                  ),
                  //Expanded(child: Container()),
                  // SvgPicture.asset(
                  //   height: 130,
                  //   fit: BoxFit.fill,
                  //   width: width,
                  //   AssetImages.lowerBackGroundPercentageScreenSvg,
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonSuffixIcon(
                    data: 'Download Pdf',
                    onTap: () async {
                      PermissionStatus status =
                          await Permission.storage.request();
                      final pdf = pw.Document();
                      if (status.isGranted) {
                        // Permission is granted, you can proceed with file operations.

                        pdf.addPage(
                          pw.Page(
                            build: (pw.Context context) {
                              // return pw.Center(
                              //   child: pw.Text(
                              //     'Hello, This is a PDF Text Component Example!',
                              //     style: pw.TextStyle(fontSize: 20.0),
                              //   ),
                              // );
                              return pw.Column(children: [
                                pw.Text(
                                  // resultProvider.remarks == ''
                                  //     ? ''
                                  //     :
                                  resultProvider
                                      .remarks, //'You are Excellent,',
                                  style: pw.TextStyle(
                                      fontSize: 15,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(
                                  '${widget.student.name}!!',
                                  style: pw.TextStyle(
                                      fontSize: 30,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  height: 25,
                                ),
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      borderRadius: pw.BorderRadius.all(
                                          pw.Radius.circular(20)),
                                      border: pw.Border.all(
                                          width: 1,
                                          color: PdfColor.fromInt(0xFFE1E3E8))),
                                  child: pw.Column(
                                    children: resultData.entries.map(
                                      (MapEntry<String, dynamic> entry) {
                                        Course c = Course.fromJson(entry.value);

                                        return pw.Row(
                                          children: [
                                            pw.Container(
                                                height: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? 50
                                                    : 35,
                                                padding: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? const pw.EdgeInsets.only(
                                                        left: 15.0,
                                                        top: 15,
                                                        bottom: 10)
                                                    : const pw.EdgeInsets.only(
                                                        left: 15.0, top: 15),
                                                child: pw.Text(
                                                  c.courseName.toString(),
                                                )),
                                            pw.Expanded(child: pw.Container()),
                                            pw.Container(
                                                height: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? 50
                                                    : 35,
                                                width: 90,
                                                padding: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? const pw.EdgeInsets.only(
                                                        left: 10.0,
                                                        top: 15,
                                                        bottom: 10)
                                                    : const pw.EdgeInsets.only(
                                                        left: 10.0, top: 15),
                                                decoration: pw.BoxDecoration(
                                                  borderRadius: entry.value ==
                                                          resultData.entries
                                                              .last.value
                                                      ? const pw.BorderRadius.only(
                                                          bottomLeft:
                                                              pw.Radius.circular(
                                                                  20))
                                                      : entry.value ==
                                                              resultData.entries
                                                                  .first.value
                                                          ? const pw.BorderRadius.only(
                                                              topLeft: pw.Radius
                                                                  .circular(20))
                                                          : const pw.BorderRadius.only(
                                                              bottomRight:
                                                                  pw.Radius.circular(
                                                                      0)),
                                                  color: PdfColor.fromInt(
                                                      AppColors.blueBgResultCard
                                                          .value),
                                                ),
                                                child: pw.Text(
                                                    c.totalMarks.toString(),
                                                    style: pw.TextStyle(
                                                        // color:
                                                        //  PdfColor(
                                                        //     0xFF3A3A3A,
                                                        //     0xFF3A3A3A,
                                                        //     0xFF3A3A3A)
                                                        ))
                                                //  AddText(
                                                //     data: c.totalMarks.toString(),
                                                //     color: AppColors.marksColor),
                                                ),
                                            pw.Container(
                                                height: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? 50
                                                    : 35,
                                                width: 90,
                                                padding: entry.value ==
                                                        resultData
                                                            .entries.last.value
                                                    ? const pw.EdgeInsets.only(
                                                        left: 10.0,
                                                        top: 15,
                                                        bottom: 10)
                                                    : const pw.EdgeInsets.only(
                                                        left: 10.0, top: 15),
                                                decoration: pw.BoxDecoration(
                                                  borderRadius: entry.value ==
                                                          resultData.entries
                                                              .last.value
                                                      ? const pw.BorderRadius.only(
                                                          bottomRight:
                                                              pw.Radius.circular(
                                                                  20))
                                                      : entry.value ==
                                                              resultData.entries
                                                                  .first.value
                                                          ? const pw.BorderRadius.only(
                                                              topRight: pw.Radius
                                                                  .circular(20))
                                                          : const pw.BorderRadius.only(
                                                              bottomRight:
                                                                  pw.Radius.circular(
                                                                      0)),
                                                  color: const PdfColor.fromInt(
                                                      0xFFD8FBDC),
                                                ),
                                                child: pw.Text(
                                                    c.obtainedMarks.toString(),
                                                    style: pw.TextStyle(
                                                        // color: PdfColor(
                                                        //     0xFF3A3A3A,
                                                        //     0xFF3A3A3A,
                                                        //     0xFF3A3A3A)
                                                        ))),
                                          ],
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ]);
                            },
                          ),
                        );
                        final Uint8List pdfBytes = await pdf.save();
                        Directory directory = Directory("");
                        if (Platform.isAndroid) {
                          //directory = Directory("/storage/emulated/0/Download");
                          directory = await getApplicationDocumentsDirectory();
                        } else {
                          directory = await getApplicationDocumentsDirectory();
                        }
                        // final output = await getTemporaryDirectory();
                        final file = File(
                            '${directory.path}/${widget.student.name}${widget.student.rollNo}.pdf');

                        await file.writeAsBytes(pdfBytes);

                        if (await file.exists()) {
                          debugPrint('----------------');
                          //OpenFile.open(file.path, type: 'application/pdf');
                          await Share.shareFiles([
                            "${file.path}"
                          ]); // this will also saves pdf in gallery
                          Fluttertoast.showToast(msg: 'Pdf saved succefully');
                          // String fileUrl = 'file://${file.path}';

                          // // Open the PDF with a PDF viewer app
                          // if (await canLaunchUrl(Uri.parse(fileUrl))) {
                          //   await launchUrl(Uri.parse(fileUrl));
                          // } else {
                          //   throw 'Could not launch $fileUrl';
                          // }
                          //await Share.shareFiles(["${file.path}"]);
                        } else {
                          print("File does not exist at $file");
                        }
                      } else if (status.isDenied) {
                        // The user denied access, handle it accordingly.
                      } else if (status.isPermanentlyDenied) {
                        // The user permanently denied access, take the user to the app settings.
                        openAppSettings();
                      }
                    },
                    width: MySize.size200,
                    height: 40,
                    gradientColor1: AppColors.appGradient2,
                    gradientColor2: AppColors.appGradient1,
                    buttonSuffixIcon: Image.asset(
                      AssetImages.pdfIcon,
                      height: MySize.size35,
                      width: MySize.size20,
                    ),
                  ),
                  // AddButton(
                  //     data: 'Download Pdf',
                  //     width: MySize.size200,
                  //     height: MySize.size40,
                  //     onTap: () {})
                ],
              ),
            ),
          ),
          SizedBox(
            height: MySize.size7,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: MySize.size100,
              //height * 0.45
            ),
            child: SvgPicture.asset(
              fit: BoxFit.fill,
              width: width,
              AssetImages.lowerBackGroundPercentageScreenSvg,
            ),
          ),
        ],
      ),
    );
  }
}
