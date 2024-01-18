import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp_school/src/controller/studentController.dart';
import 'package:erp_school/src/eventDetails.dart';
import 'package:erp_school/src/model/event&Program.dart';
import 'package:erp_school/src/provider/eventProvider.dart';
import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/widgets/addTextBackgroundColor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  DateFormat dayName = DateFormat('EEEE');
  DateFormat monthName = DateFormat('MMM');

  List<EventProgram> elist = [];

  // bool isEventLoaded = false;

  StudentController s = StudentController();
  getEvents() async {
    elist = await s.getEvents().then((value) {
      print('');
      setState(() {
        // isEventLoaded = true;
      });
      return value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //EventProvider eventProvider = Provider.of<EventProvider>(context);
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    EventProgram e = EventProgram.setEvent(
        eventName: 'Sleepover Night',
        details:
            'A sleepover is a great treat for kids. Many schools use such an event as the culminating activity of the school year. ',
        dateTime: DateTime(21, 1, 6, 9),
        image: '');
    EventProgram e1 = EventProgram.setEvent(
        eventName: 'Fishing Tournament',
        details:
            'Silver Sands Middle School in Port Orange, Florida, offers many special events, but one of the most unique ones is a springtime...',
        dateTime: DateTime(21, 1, 12, 9),
        image: '');
    EventProgram e2 = EventProgram.setEvent(
        eventName: 'Rhyme Time: A Night of Poetry',
        details:
            'April is also National Poetry Month. Now there is a great theme for a fun family night! Combine poetry readings by students...',
        dateTime: DateTime(21, 1, 24, 9),
        image: '');
    List<EventProgram> epl = [];
    epl.add(e);
    epl.add(e1);
    epl.add(e2);

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Future.delayed(const Duration(seconds: 1), () {
                      //timeTableProvider.clear();
                    });
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
                        data: 'Events & Programs',
                        color: Colors.white,
                        textSize: MySize.size20,
                      ),
                      Expanded(child: Container()),
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Events')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var m = snapshot.data!.docs;
                      //print(m.toString());
                      elist.clear();
                      for (var i = 0; i < snapshot.data!.docs.length; i++) {
                        var singleSnapshot = m[i];
                        print(singleSnapshot.toString() + '----------');
                        EventProgram e =
                            EventProgram.fromJson(singleSnapshot.data());
                        print(e.eventName.toString());
                        elist.add(e);
                      }
                      return ListView.builder(
                          itemCount: elist.length,
                          itemBuilder: ((context, index) {
                            EventProgram epp = elist[index];
                            print('-------------------');
                            print(epp.eventName);
                            String amPm = epp.dateTime!.hour < 12 ? 'AM' : 'PM';
                            return Padding(
                                padding: EdgeInsets.only(
                                    bottom: 16,
                                    left: width * 0.04,
                                    right: width * 0.04),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EventDetails(ep: epp)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.greyDivider1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        )),
                                    child: Padding(
                                      padding: EdgeInsets.all(MySize.size10),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AddText(
                                              data: epp.eventName.toString(),
                                              textSize: 14,
                                              textWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MySize.size75,
                                                  height: MySize.size75,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          epp.image!.toString(),
                                                        ),
                                                        fit: BoxFit.fill),
                                                    // color: AppColors
                                                    //     .blueBgResultCard
                                                  ),
                                                  child: Image.network(
                                                    epp.image!.toString(),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          AssetImages
                                                              .clockIconBlue,
                                                          height: 13,
                                                          width: 13,
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        AddText(
                                                          // ignore: prefer_interpolation_to_compose_strings
                                                          data: epp
                                                                  .dateTime!.day
                                                                  .toString() +
                                                              " " +
                                                              monthName.format(epp
                                                                  .dateTime!) +
                                                              " " +
                                                              epp.dateTime!.year
                                                                  .toString() +
                                                              ', ' +
                                                              epp.dateTime!.hour
                                                                  .toString() +
                                                              ":" +
                                                              epp.dateTime!
                                                                  .minute
                                                                  .toString()
                                                                  .padLeft(
                                                                      2, '0') +
                                                              " " +
                                                              amPm,
                                                          textSize: 13,
                                                          textWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .blueColor,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                        width: width * 0.65,
                                                        child: Text(
                                                          epp.details
                                                              .toString(),
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .grey7777),
                                                        ))
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          }));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        )),
      ],
    ));
  }
}
