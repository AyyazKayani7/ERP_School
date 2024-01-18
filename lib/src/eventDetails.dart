import 'package:erp_school/src/model/event&Program.dart';
import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/utilities/colors.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:erp_school/src/widgets/addText.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatefulWidget {
  EventProgram? ep;
  EventDetails({super.key, required this.ep});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String amPm = widget.ep!.dateTime!.hour < 12 ? 'AM' : 'PM';

    DateFormat dayName = DateFormat('EEEE');
    DateFormat monthName = DateFormat('MMM');
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: AppColors.greyShade,
                  image: DecorationImage(
                      image: NetworkImage(widget.ep!.image.toString()),
                      fit: BoxFit.fill),
                ),
                padding:
                    EdgeInsets.only(left: MySize.size16, top: MySize.size55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AssetImages.backIconWhite,
                        height: MySize.size20,
                        width: MySize.size12,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: MySize.size18),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AssetImages.clockIconBlue,
                          height: 13,
                          width: 13,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        AddText(
                          // ignore: prefer_interpolation_to_compose_strings
                          data: widget.ep!.dateTime!.day.toString() +
                              " " +
                              monthName.format(widget.ep!.dateTime!) +
                              " " +
                              widget.ep!.dateTime!.year.toString() +
                              ', ' +
                              widget.ep!.dateTime!.hour.toString() +
                              ":" +
                              widget.ep!.dateTime!.minute
                                  .toString()
                                  .padLeft(2, '0') +
                              " " +
                              amPm,
                          textSize: 13,
                          textWeight: FontWeight.w600,
                          color: AppColors.blueColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AddText(
                      data: widget.ep!.eventName.toString(),
                      textWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AddText(
                      textAlign: TextAlign.start,
                      data: widget.ep!.details.toString(),
                      textSize: 13,
                      color: AppColors.grey7777,
                      textWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
