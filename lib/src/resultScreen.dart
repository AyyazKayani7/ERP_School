import 'package:erp_school/src/utilities/mySize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'model/result.dart';
import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'widgets/addText.dart';

class ResultScreen extends StatefulWidget {
  String studentName;
  ResultScreen({super.key, required this.studentName});

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
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                            Padding(
                              padding:
                                  EdgeInsets.only(left: width * 0.04, top: 40),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AddText(
                                        data: '85%',
                                        textSize: 38,
                                        textWeight: FontWeight.w600,
                                      ),
                                      AddText(
                                        data: 'Grade A',
                                        textSize: 15,
                                        textWeight: FontWeight.w700,
                                      ),
                                    ],
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
                  AddText(
                    data: 'You are Excellent,',
                    textSize: 15,
                    textWeight: FontWeight.w600,
                  ),
                  AddText(
                    data: '${widget.studentName}!!',
                    textSize: 30,
                    textWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            width: 1,
                          )),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 14,
                                  ),
                                  child: AddText(data: 'English')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 14,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.englishTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 14,
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.englishObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Hindi')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.hindiTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.hindiObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Hindi')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.hindiTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.hindiObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Hindi')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.hindiTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.hindiObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Science')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.scienceTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.scienceObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Math')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.mathTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.mathObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Social Study')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.socialStudyTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data:
                                      stdResult.socialStudyObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Social Study')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.socialStudyTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data:
                                      stdResult.socialStudyObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Social Study')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.socialStudyTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data:
                                      stdResult.socialStudyObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10,
                                  ),
                                  child: AddText(data: 'Drawing')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.drawingTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.drawingObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10, bottom: 14),
                                  child: AddText(data: 'Computer')),
                              Expanded(child: Container()),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10, bottom: 14),
                                decoration: const BoxDecoration(
                                    color: AppColors.blueBgResultCard),
                                child: AddText(
                                  data: stdResult.computerTotal.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                              Container(
                                width: MySize.size90,
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10, bottom: 14),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20)),
                                    color: Color.fromARGB(255, 216, 251, 220)),
                                child: AddText(
                                  data: stdResult.computerObtained.toString(),
                                  color: AppColors.marksColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Expanded(child: Container()),
                  SvgPicture.asset(
                    height: 130,
                    fit: BoxFit.fill,
                    width: width,
                    AssetImages.lowerBackGroundPercentageScreenSvg,
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: MySize.size7,
          // ),
          // Container(
          //   constraints: BoxConstraints(
          //     maxHeight: MySize.size100,
          //     //height * 0.45
          //   ),
          //   child: SvgPicture.asset(
          //     fit: BoxFit.fill,
          //     width: width,
          //     AssetImages.lowerBackGroundPercentageScreenSvg,
          //   ),
          // ),
        ],
      ),
    );
  }
}
