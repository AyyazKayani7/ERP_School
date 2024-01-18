import 'package:erp_school/src/provider/attendanceProvider.dart';
import 'package:erp_school/src/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'model/attendance.dart';
import 'utilities/asset_images.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  void initState() {
    // Map<DateTime, List<dynamic>> allEvents = TableCalendar.of(context)
  }
  List<AttendanceModel> a = [
    AttendanceModel(DateTime(2024, 1, 14), 'Diwali'),
    AttendanceModel(DateTime(2024, 1, 15), 'Govardhan Puja'),
    AttendanceModel(DateTime(2024, 1, 16), 'Bhaiya Dooj')
  ];
  List<Map<DateTime, String>> events = [
    {DateTime(2024, 1, 14): 'Diwali'},
    {
      DateTime(2024, 1, 15): 'Govardhan Puja',
    },
    {
      DateTime(2024, 1, 16): 'Bhaiya Dooj',
    }
  ];

  final Map<DateTime, List<dynamic>> _events = {
    DateTime(2024, 1, 14): ['Diwali'],
    DateTime(2024, 1, 15): ['Govardhan Puja'],
    DateTime(2024, 1, 16): ['Bhaiya Dooj'],
  };
  List<DateTime> absents = [DateTime(2024, 1, 8), DateTime(2024, 1, 23)];
  final Map<DateTime, List<dynamic>> _markedDates = {
    DateTime(2023, 12, 25): ['Event 1'],
    DateTime(2023, 12, 31): ['Event 2'],
    DateTime(2023, 12, 10): [
      null
    ], // Null value indicates no event, but marked date
    DateTime(2023, 12, 15): [null], // Another marked date with no event
  };
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DateFormat month = DateFormat('MMMM');
    DateFormat day = DateFormat('EEEE');
    AttendanceProvider attendanceProvider =
        Provider.of<AttendanceProvider>(context, listen: false);
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
                      SizedBox(
                        width: MySize.size100,
                      ),
                      Consumer<AttendanceProvider>(
                          builder: (context, value, child) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: AppColors.blueLightColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ignore: unrelated_type_equality_checks
                              GestureDetector(
                                onTap: () {
                                  value.setIndex(0);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: value.getIndex != 0
                                          ? width * 0.01
                                          : 0),
                                  height: MySize.size30,
                                  width: value.getIndex == 0
                                      ? MySize.size100
                                      : MySize.size95,
                                  decoration: value.getIndex == 0
                                      ? const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        )
                                      : const BoxDecoration(),
                                  child: Center(
                                    child: AddText(
                                      color: value.getIndex == 0
                                          ? AppColors.blueTextColor
                                          : Colors.white,
                                      data: 'ATTENDANCE',
                                      textSize: 13,
                                      textWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  value.setIndex(1);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: value.getIndex != 1
                                          ? width * 0.01
                                          : 0),
                                  height: 27,
                                  width: value.getIndex == 1
                                      ? MySize.size100
                                      : MySize.size95,
                                  decoration: value.getIndex == 1
                                      ? const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        )
                                      : const BoxDecoration(),
                                  child: Center(
                                    child: AddText(
                                      color: value.getIndex == 1
                                          ? AppColors.blueTextColor
                                          : Colors.white,
                                      data: 'HOLIDAY',
                                      textSize: 13,
                                      textWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      Expanded(child: Container())
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: TableCalendar(
                              eventLoader: (day) {
                                return _events[day] ?? [];
                              },
                              calendarStyle: const CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purple),
                                markerDecoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                // Customize the background color for Sundays
                                weekendDecoration: BoxDecoration(
                                  color: AppColors
                                      .sundayCell, // Change the background color here
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(
                                  //     8.0), // Optional: Rounded corners
                                ),
                                // Other calendar style properties as needed
                              ),
                              headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true),
                              focusedDay: DateTime(2024, 1, 2),
                              firstDay: DateTime(2000, 1, 1),
                              lastDay: DateTime(3000, 1, 1),
                              weekendDays: const [DateTime.sunday],
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              calendarBuilders: CalendarBuilders(
                                markerBuilder: (context, day, events) {
                                  ///////////////////////////
                                  debugPrint(day.toString());
                                  debugPrint(
                                      _events[day]?.isNotEmpty.toString());
                                  return (_events[day] != null &&
                                          _events[day]!.isNotEmpty)
                                      ? Container(
                                          margin: EdgeInsets.all(4.0),
                                          width: 5,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                          ),
                                        )
                                      : SizedBox.shrink();
                                  //////////////////////////////
                                  // Create a list of marker widgets for the specified day
                                  List<Widget> markers = [];
                                  //debugPrint(_events.toString());
                                  // debugPrint(day
                                  //     .toIso8601String()
                                  //     .replaceAll('Z', ''));
                                  // Add markers for events if they exist for the current day
                                  DateTime correctDateFormat = DateTime.parse(
                                      day
                                          .toIso8601String()
                                          .replaceAll('Z', ''));

                                  //debugPrint(correctDateFormat.toString());
                                  if (_events.containsKey(correctDateFormat)) {
                                    debugPrint("$_events     mnnbmjbj");
                                    //setState(() {});
                                    // Timer laga k check bey
                                    markers.add(
                                      Positioned(
                                        bottom: 1,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors
                                                .teal, // Change marker color here
                                          ),
                                          width: 80,
                                          height: 80,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                holidayBuilder: (context, day, focusedDay) {
                                  return Container(
                                    margin: const EdgeInsets.all(4.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: day.weekday == DateTime.sunday
                                          ? Colors.red
                                          : null,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text('${day.day}'),
                                  );
                                },

                                // Custom styling for the day cells
                              )),
                        ),
                        // EventCalendar(
                        //   calendarType: CalendarType.JALALI,
                        // ),
                        // CalendarDatePicker(
                        //     initialDate: DateTime(2010, 1, 1),
                        //     firstDate: DateTime(2000, 1, 10),
                        //     lastDate: DateTime.now(),
                        //     onDateChanged: (DateTime) {})
                        SizedBox(
                          height: MySize.size10,
                        ),
                        Consumer<AttendanceProvider>(
                            builder: (context, value, child) {
                          return value.getIndex == 0
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.red),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MySize.size16,
                                              decoration: const BoxDecoration(
                                                  color: AppColors.red,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            SizedBox(
                                              width: MySize.size12,
                                            ),
                                            AddText(
                                              data: 'Absent',
                                              textSize: 14,
                                              textWeight: FontWeight.w400,
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: MySize.size15),
                                              height: MySize.size28,
                                              width: MySize.size28,
                                              decoration: const BoxDecoration(
                                                color: AppColors.lightRed,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                              ),
                                              child: Center(
                                                child: AddText(
                                                  data:
                                                      absents.length.toString(),
                                                  color: AppColors.red,
                                                  textSize: 13,
                                                  textWeight: FontWeight.w700,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: MySize.size15,
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MySize.size16,
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            SizedBox(
                                              width: MySize.size12,
                                            ),
                                            AddText(
                                              data: 'Festival & Holidays',
                                              textSize: 14,
                                              textWeight: FontWeight.w400,
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: MySize.size15),
                                              height: MySize.size28,
                                              width: MySize.size28,
                                              decoration: const BoxDecoration(
                                                color: AppColors.lightGreen,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                              ),
                                              child: Center(
                                                child: AddText(
                                                  data:
                                                      _events.length.toString(),
                                                  color: AppColors.green,
                                                  textSize: 13,
                                                  textWeight: FontWeight.w700,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: MySize.size10,
                                      )
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AddText(
                                          data: 'List of Holidays',
                                          textWeight: FontWeight.w400,
                                        ),
                                        // SizedBox(
                                        //   height: MySize.size12,
                                        // ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: a.length,
                                          itemBuilder: (context, index) {
                                            //Map<DateTime, String> map=events[index];
                                            AttendanceModel aa = a[index];
                                            int cday = aa.date!.day;

                                            // Handle cases for suffixes for 1st, 2nd, 3rd, and other numbers
                                            String suffix = 'th';
                                            if (cday % 10 == 1 && cday != 11) {
                                              suffix = 'st';
                                            } else if (cday % 10 == 2 &&
                                                cday != 12) {
                                              suffix = 'nd';
                                            } else if (cday % 10 == 3 &&
                                                cday != 13) {
                                              suffix = 'rd';
                                            }

                                            return Column(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .greyDivider1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                    // color: Colors.amber,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MySize.size15,
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.84,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  MySize.size12,
                                                            ),
                                                            AddText(
                                                              data: aa.eventName
                                                                  .toString(),
                                                              textSize: 16,
                                                              textWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment:
                                                              //     MainAxisAlignment
                                                              //         .spaceBetween,
                                                              children: [
                                                                AddText(
                                                                  data:
                                                                      '$cday$suffix ${month.format(aa.date!)}',
                                                                  textSize: 14,
                                                                  textWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .grey7777,
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                // SizedBox(
                                                                //   width: MySize.size220,
                                                                // ),
                                                                AddText(
                                                                  data: day
                                                                      .format(aa
                                                                          .date!),
                                                                  textSize: 14,
                                                                  textWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .grey7777,
                                                                ),
                                                                // Expanded(
                                                                //     child: Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        }),
                      ],
                    ),
                  )),
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
