// ignore_for_file: unnecessary_null_comparison

import 'package:erp_school/src/model/DailyTimeTable.dart';
import 'package:erp_school/src/model/DailyTimeTable.dart';
import 'package:erp_school/src/model/weeklyTimeTable.dart';
import 'package:erp_school/src/provider/courseProvider.dart';
import 'package:erp_school/src/provider/timeTableProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:erp_school/src/model/courseDetail.dart';
import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CourseDetail c1 = CourseDetail(
        courseName: 'Computer Science',
        startTime: DateTime(2023, 12, 20, 8, 15, 0),
        endTime: DateTime(2023, 12, 20, 9, 00, 0),
        periodNo: 'Period 1',
        teacherName: "Cherise James",
        lunchBreakStatus: 0);
    CourseDetail c2 = CourseDetail(
        courseName: 'Mathematics',
        startTime: DateTime(2023, 12, 20, 9, 00, 0),
        endTime: DateTime(2023, 12, 20, 9, 45, 0),
        periodNo: 'Period 2',
        teacherName: "Revka Steadman",
        lunchBreakStatus: 0);
    CourseDetail c3 = CourseDetail(
        courseName: 'English',
        startTime: DateTime(2023, 12, 20, 9, 45, 0),
        endTime: DateTime(2023, 12, 20, 10, 30, 0),
        periodNo: 'Period 3',
        teacherName: "Marta Magane",
        lunchBreakStatus: 0);
    CourseDetail c4 = CourseDetail(
        courseName: 'Lunch Break',
        startTime: DateTime(2023, 12, 20, 10, 30, 0),
        endTime: DateTime(2023, 12, 20, 11, 00, 0),
        periodNo: '',
        teacherName: "",
        lunchBreakStatus: 1);
    CourseDetail c5 = CourseDetail(
        courseName: 'Science',
        startTime: DateTime(2023, 12, 20, 11, 00, 0),
        endTime: DateTime(2023, 12, 20, 11, 45, 0),
        periodNo: 'Period 4',
        teacherName: "Danica Partridge",
        lunchBreakStatus: 0);
    CourseDetail c6 = CourseDetail(
        courseName: 'Social Study',
        startTime: DateTime(2023, 12, 20, 11, 45, 0),
        endTime: DateTime(2023, 12, 20, 12, 30, 0),
        periodNo: 'Period 5',
        teacherName: "Alex Royce",
        lunchBreakStatus: 0);

    List<CourseDetail> mondayCoursesList = [];
    mondayCoursesList.add(c1);
    mondayCoursesList.add(c2);
    mondayCoursesList.add(c3);
    mondayCoursesList.add(c4);
    mondayCoursesList.add(c5);
    mondayCoursesList.add(c6);

    DailyTimeTable mondayCourseList =
        DailyTimeTable.setValues(mondayCoursesList, 'Monday'
            //DateTime(2023, 12, 18)
            );

    CourseDetail c7 = CourseDetail(
        courseName: 'English',
        startTime: DateTime(2023, 12, 20, 8, 15, 0),
        endTime: DateTime(2023, 12, 20, 9, 00, 0),
        periodNo: 'Period 1',
        teacherName: "Cherise James",
        lunchBreakStatus: 0);
    CourseDetail c8 = CourseDetail(
        courseName: 'Computer Science',
        startTime: DateTime(2023, 12, 20, 9, 00, 0),
        endTime: DateTime(2023, 12, 20, 9, 45, 0),
        periodNo: 'Period 2',
        teacherName: "Revka Steadman",
        lunchBreakStatus: 0);
    CourseDetail c9 = CourseDetail(
        courseName: 'Mathematics',
        startTime: DateTime(2023, 12, 20, 9, 45, 0),
        endTime: DateTime(2023, 12, 20, 10, 30, 0),
        periodNo: 'Period 3',
        teacherName: "Marta Magane",
        lunchBreakStatus: 0);
    CourseDetail c10 = CourseDetail(
        courseName: 'Science',
        startTime: DateTime(2023, 12, 20, 11, 00, 0),
        endTime: DateTime(2023, 12, 20, 11, 45, 0),
        periodNo: 'Period 4',
        teacherName: "Danica Partridge",
        lunchBreakStatus: 0);
    CourseDetail c11 = CourseDetail(
        courseName: 'Lunch Break',
        startTime: DateTime(2023, 12, 20, 10, 30, 0),
        endTime: DateTime(2023, 12, 20, 11, 00, 0),
        periodNo: '',
        teacherName: "",
        lunchBreakStatus: 1);

    CourseDetail c12 = CourseDetail(
        courseName: 'Social Study',
        startTime: DateTime(2023, 12, 20, 11, 45, 0),
        endTime: DateTime(2023, 12, 20, 12, 30, 0),
        periodNo: 'Period 5',
        teacherName: "Alex Royce",
        lunchBreakStatus: 0);

    List<CourseDetail> tuesdayCoursesList = [];
    tuesdayCoursesList.add(c7);
    tuesdayCoursesList.add(c8);
    tuesdayCoursesList.add(c9);
    tuesdayCoursesList.add(c10);
    tuesdayCoursesList.add(c11);
    tuesdayCoursesList.add(c12);

    DailyTimeTable tuesdayCourseList =
        DailyTimeTable.setValues(tuesdayCoursesList, 'Tuesday'
            //DateTime(2023, 12, 18)
            );
    List<DailyTimeTable> weeklyTimeTable = [];
    weeklyTimeTable.add(mondayCourseList);
    weeklyTimeTable.add(tuesdayCourseList);
    //final courseProvider = Provider.of<CourseProvider>(context, listen: false);
    //DailyTimeTable selectedDailyTimeTable = DailyTimeTable();
    TimeTableProvider timeTableProvider =
        Provider.of<TimeTableProvider>(context, listen: false);
    for (var element in weeklyTimeTable) {
      if (element.day == "Monday") {
        //selectedDailyTimeTable = element;
        timeTableProvider.setCourseDetails(element.cl!);
        break;
      }
    }
    //WeeklyTimeTable weeklyTimeTable = WeeklyTimeTable(mondayCourseList);

    debugPrint(timeTableProvider.getIndex.toString());
    return WillPopScope(
      onWillPop: () async {
        Future.delayed(const Duration(seconds: 1), () {
          // Call timeTableProvider.clear() after the specified duration
          timeTableProvider.clear();
        });
        return true;
      },
      child: Scaffold(
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
                          onTap: () {
                            Navigator.pop(context);
                            Future.delayed(const Duration(seconds: 1), () {
                              timeTableProvider.clear();
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
                          data: 'Timetable',
                          color: Colors.white,
                          textSize: MySize.size20,
                        ),
                        Expanded(child: Container()),
                      ],
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MySize.size24,
                        left: width * 0.05, //MySize.size16,
                        right: width * 0.05, //MySize.size16,
                      ),
                      child: Container(
                        height: 27,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          border: Border.all(
                              width: 1, color: AppColors.greyDivider),
                        ),
                        child: Consumer<TimeTableProvider>(
                            builder: (context, timeTableProvider, child) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ignore: unrelated_type_equality_checks
                                GestureDetector(
                                  onTap: () {
                                    //element.cl![0].toJson().toString()
                                    timeTableProvider.setIndex(0);
                                    for (var element in weeklyTimeTable) {
                                      if (element == null) {
                                        timeTableProvider.clear();
                                      } else {
                                        if (element.day == "Monday") {
                                          //selectedDailyTimeTable = element;
                                          timeTableProvider
                                              .setCourseDetails(element.cl!);
                                          break;
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: timeTableProvider.getIndex != 0
                                            ? width * 0.01
                                            : 0),
                                    height: 27,
                                    width: timeTableProvider.getIndex == 0
                                        ? 77
                                        : 50,
                                    decoration: timeTableProvider.getIndex == 0
                                        ? const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Center(
                                      child: AddText(
                                        color: timeTableProvider.getIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                        data: 'MON',
                                        textSize: 13,
                                        textWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    timeTableProvider.setIndex(1);
                                    for (var element in weeklyTimeTable) {
                                      if (element == null) {
                                        timeTableProvider.clear();
                                      } else {
                                        if (element.day == "Tuesday") {
                                          //selectedDailyTimeTable = element;
                                          timeTableProvider
                                              .setCourseDetails(element.cl!);
                                          break;
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 27,
                                    width: timeTableProvider.getIndex == 1
                                        ? 77
                                        : 50,
                                    decoration: timeTableProvider.getIndex == 1
                                        ? const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Center(
                                      child: AddText(
                                        color: timeTableProvider.getIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                        data: 'TUE',
                                        textSize: 13,
                                        textWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    timeTableProvider.setIndex(2);
                                    for (var element in weeklyTimeTable) {
                                      if (element == null) {
                                        timeTableProvider.clear();
                                      } else {
                                        if (element.day == "Wednesday") {
                                          //selectedDailyTimeTable = element;
                                          timeTableProvider
                                              .setCourseDetails(element.cl!);
                                          break;
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 27,
                                    width: timeTableProvider.getIndex == 2
                                        ? 77
                                        : 50,
                                    decoration: timeTableProvider.getIndex == 2
                                        ? const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Center(
                                      child: AddText(
                                        color: timeTableProvider.getIndex == 2
                                            ? Colors.white
                                            : Colors.black,
                                        data: 'WED',
                                        textSize: 13,
                                        textWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    timeTableProvider.setIndex(3);
                                    for (var element in weeklyTimeTable) {
                                      if (element.day == "Thursday") {
                                        //selectedDailyTimeTable = element;
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 27,
                                    width: timeTableProvider.getIndex == 3
                                        ? 77
                                        : 50,
                                    decoration: timeTableProvider.getIndex == 3
                                        ? const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Center(
                                      child: AddText(
                                        color: timeTableProvider.getIndex == 3
                                            ? Colors.white
                                            : Colors.black,
                                        data: 'THU',
                                        textSize: 13,
                                        textWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    timeTableProvider.setIndex(4);
                                    for (var element in weeklyTimeTable) {
                                      if (element.day == "Friday") {
                                        // selectedDailyTimeTable = element;
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 27,
                                    width: timeTableProvider.getIndex == 4
                                        ? 77
                                        : 50,
                                    decoration: timeTableProvider.getIndex == 4
                                        ? const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Center(
                                      child: AddText(
                                        color: timeTableProvider.getIndex == 4
                                            ? Colors.white
                                            : Colors.black,
                                        data: 'FRI',
                                        textSize: 13,
                                        textWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    timeTableProvider.setIndex(5);
                                    debugPrint(
                                        timeTableProvider.getIndex.toString());
                                    for (var element in weeklyTimeTable) {
                                      if (element.day == "Saturday") {
                                        //selectedDailyTimeTable = element;
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        right: timeTableProvider.getIndex != 5
                                            ? width * 0.01
                                            : 0),
                                    height: 27,
                                    width: timeTableProvider.getIndex == 5
                                        ? 77
                                        : 50,
                                    decoration: timeTableProvider.getIndex == 5
                                        ? const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Center(
                                      child: AddText(
                                        color: timeTableProvider.getIndex == 5
                                            ? Colors.white
                                            : Colors.black,
                                        data: 'SAT',
                                        textSize: 13,
                                        textWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ]);
                        }),
                      ),
                    ),
                    Expanded(
                      child: Consumer<TimeTableProvider>(
                        builder: (context, timeTableProvider, child) {
                          return ListView.builder(
                              itemCount:
                                  timeTableProvider.completeCourse.length,
                              itemBuilder: (context, index) {
                                CourseDetail course = CourseDetail();
                                //course = selectedDailyTimeTable!.cl![index];
                                course =
                                    timeTableProvider.completeCourse[index];
                                // String timeTableDay =
                                //     DateFormat('EEEE').format(dtt.day!);
                                String amPmStartTime =
                                    course.startTime!.hour < 12 ? 'am' : 'pm';
                                String amPmEndTime =
                                    course.endTime!.hour < 12 ? 'am' : 'pm';
                                //String d = monthFormat.format(fd.paymentDate!);
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.greyDivider),
                                      ),
                                      margin: EdgeInsets.only(
                                        // top: MySize.size16,
                                        left: width * 0.05, //MySize.size16,
                                        right: width * 0.05, //MySize.size16,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: width * 0.03,
                                              top: MySize.size8,
                                              //right: width * 0.01
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: width * 0.72,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AddText(
                                                        data: course.courseName
                                                            .toString(),
                                                        textWeight:
                                                            FontWeight.w600,
                                                        textSize: 14,
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          AddText(
                                                            data:
                                                                "${course.startTime!.hour % 12}:${course.startTime!.minute.toString().padLeft(2, '0')}$amPmStartTime - ${course.endTime!.hour}:${course.endTime!.minute.toString().padLeft(2, '0')}$amPmEndTime",

                                                            /// issue was 9:0, by doing .padLeft this 9:00
                                                            textWeight:
                                                                FontWeight.w400,
                                                            textSize: 14,
                                                            color: AppColors
                                                                .greyTextColor,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                course.lunchBreakStatus == 0
                                                    ? Container()
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          // course.lunchBreakStatus == 0
                                                          //     ? Container()
                                                          //     : SizedBox(
                                                          //         width: width * 0.32,
                                                          //       ),
                                                          Image.asset(
                                                              height:
                                                                  MySize.size40,
                                                              width:
                                                                  MySize.size40,
                                                              AssetImages
                                                                  .lunchBreakIcon),
                                                          SizedBox(
                                                            width:
                                                                MySize.size10,
                                                          )
                                                        ],
                                                      )
                                              ],
                                            ),
                                          ),
                                          course.lunchBreakStatus == 1
                                              ? Container()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14,
                                                          top: 2,
                                                          right: 14),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      top: MySize.size10,
                                                    ),
                                                    child: const Divider(
                                                      thickness: 1,
                                                      height: 1,
                                                      color:
                                                          AppColors.greyDivider,
                                                    ),
                                                  ),
                                                ),
                                          course.lunchBreakStatus == 1
                                              ? Container()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14,
                                                          top: 8,
                                                          right: 14),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AddText(
                                                        data: course.teacherName
                                                            .toString(),
                                                        textWeight:
                                                            FontWeight.w400,
                                                        textSize: 14,
                                                        color: AppColors
                                                            .greyTextColor,
                                                      ),
                                                      AddText(
                                                        data: course.periodNo
                                                            .toString(),
                                                        textWeight:
                                                            FontWeight.w600,
                                                        textSize: 14,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
