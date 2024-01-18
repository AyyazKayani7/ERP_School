import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:erp_school/src/model/QuizQuestion.dart';
import 'package:erp_school/src/provider/quizProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:provider/provider.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key});

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

enum SingingCharacter { lafayette, jefferson }

class _PlayQuizState extends State<PlayQuiz> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuizProvider quizP = Provider.of<QuizProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      quizP.setTotalQuestions(quizP.questions.length);
      quizP.startTimer();
      startTimer();

      ///Progress Bar timer
    });
    //startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    QuizProvider quizP = Provider.of<QuizProvider>(context, listen: false);
    quizP.dispose();
    //super.dispose();
  }

  int progressValue = 0;
  void startTimer() {
    const duration = const Duration(seconds: 1);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        if (progressValue == 30) {
          timer.cancel();
        } else {
          progressValue += 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SingingCharacter _character = SingingCharacter.lafayette;

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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                          data: 'Pay Quiz',
                          color: Colors.white,
                          textWeight: FontWeight.w400,
                          textSize: MySize.size20,
                        ),
                        Expanded(child: Container()),
                        AddText(
                          data: 'Skip',
                          color: Colors.white,
                          textWeight: FontWeight.w400,
                          textSize: MySize.size20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                //color: AppColors.appGradient2,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: const GradientRotation(-314 * 3.1416 / 180),
                  colors: [
                    AppColors.appGradient1,
                    AppColors.appGradient2.withOpacity(0.95)
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child:
                          // Stack(
                          //   children: [
                          //     FAProgressBar(
                          //         size: 32,
                          //         border: Border.all(
                          //             width: 2,
                          //             color: AppColors.progressTimeBarBackground),
                          //         //changeColorValue: 1,
                          //         //displayText: progressValue.toString(),
                          //         displayTextStyle: TextStyle(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w400,
                          //             color: Colors.white),
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(100)),
                          //         currentValue: progressValue.toDouble(),
                          //         //animatedDuration: Duration(seconds: 1),
                          //         progressColor: AppColors.progressTimeBar,
                          //         backgroundColor:
                          //             AppColors.progressTimeBarBackground,
                          //         maxValue: 30),
                          //     Positioned(
                          //       left: 20,
                          //       top: 6.5,
                          //       child: AddText(
                          //         data: progressValue.toString(),
                          //         textSize: 14,
                          //         color: Colors.white,
                          //         textWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Positioned(
                          //       right: 20,
                          //       top: 7.5,
                          //       child: Image.asset(
                          //         AssetImages.clockIcon1,
                          //         height: 16,
                          //         width: 16,
                          //       ),
                          //     )
                          //   ],
                          // )

                          Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: AppColors.progressTimeBarBackground),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: const LinearTimer(
                                color: AppColors.progressTimeBar,
                                backgroundColor:
                                    AppColors.progressTimeBarBackground,
                                minHeight: 30,
                                duration: Duration(seconds: 30),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 6.5,
                            child: AddText(
                              data: progressValue.toString(),
                              textSize: 14,
                              color: Colors.white,
                              textWeight: FontWeight.w400,
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 7.5,
                            child: Image.asset(
                              AssetImages.clockIcon1,
                              height: 16,
                              width: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MySize.size30,
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AddText(
                            data: 'Question 1',
                            textSize: 30,
                            textWeight: FontWeight.w400,
                            color: AppColors.greyMainTextFFF,
                          ),
                          SizedBox(
                            height: 25,
                            child: AddText(
                              data: ' /10',
                              textSize: 18,
                              textWeight: FontWeight.w400,
                              color: AppColors.greyMainTextFFF,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            height: 32,
                            // width: 82,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1216),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20))
                                //color: Colors.teal
                                ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset(
                                  AssetImages.quizPersonsIcon,
                                  height: 12,
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                AddText(
                                  data: '276',
                                  color: AppColors.greyMainTextFFF,
                                  textSize: 13,
                                  textWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MySize.size20,
                    ),
                    const DottedLine(
                      dashColor: AppColors.greyMainTextFFF,
                      dashGapLength: 5,
                    ),
                    SizedBox(
                      height: MySize.size30,
                    ),
                    Container(
                      //height: MySize.size510,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Container(
                                height: MySize.size400,
                                width: MySize.size300,
                                decoration: const BoxDecoration(
                                    color: AppColors.card2,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Center(
                              child: Container(
                                height: MySize.size400,
                                width: MySize.size350,
                                decoration: const BoxDecoration(
                                    color: AppColors.card1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                            ),
                          ),
                          Container(
                              height: MySize.size400,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MySize.size15,
                                      vertical: MySize.size5),
                                  child: Consumer<QuizProvider>(
                                    builder: (context, p, child) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AddText(
                                          textAlign: TextAlign.left,
                                          data: p
                                              .questions[p.currentQuestionIndex]
                                              .question,
                                          textSize: 20,
                                          textWeight: FontWeight.w700,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        Column(
                                          children: List.generate(
                                            p.questions[p.currentQuestionIndex]
                                                .options.length,
                                            (index) {
                                              //debugPrint(q.options.toString());
                                              //String text = questions.options[].to;
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                child: Container(
                                                  height: MySize.size60,
                                                  width: MySize.size370,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color:
                                                          AppColors.greyDivider,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                MySize.size15),
                                                    child: Row(
                                                      children: [
                                                        AddText(
                                                          data: p
                                                              .questions[p
                                                                  .currentQuestionIndex]
                                                              .options[index],
                                                          textSize: 16,
                                                          textWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .greyTextColor,
                                                        ),
                                                        Expanded(
                                                            child: Container()),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (p
                                                                    .questions[p
                                                                        .currentQuestionIndex]
                                                                    .optionSelected ==
                                                                0) {
                                                              p
                                                                  .questions[p
                                                                      .currentQuestionIndex]
                                                                  .optionSelected = 1;
                                                            } else if (p
                                                                    .questions[p
                                                                        .currentQuestionIndex]
                                                                    .optionSelected ==
                                                                1) {
                                                              p
                                                                  .questions[p
                                                                      .currentQuestionIndex]
                                                                  .optionSelected = 0;
                                                            } else {
                                                              p
                                                                  .questions[p
                                                                      .currentQuestionIndex]
                                                                  .optionSelected = 3;
                                                            }

                                                            p.ac = true;
                                                            if (p
                                                                    .questions[p
                                                                        .currentQuestionIndex]
                                                                    .correctOptionIndex ==
                                                                index) {
                                                              p.setcorrectAnswer(
                                                                  1);
                                                              p.setSelectedAnswer(
                                                                  index);
                                                            } else {
                                                              p.setcorrectAnswer(
                                                                  2);
                                                            }
                                                          },
                                                          child: Container(
                                                            height:
                                                                MySize.size26,
                                                            width:
                                                                MySize.size26,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: p.getColor(p
                                                                      .questions[
                                                                          p.currentQuestionIndex]
                                                                      .optionSelected)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    100),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),

                                        // const SizedBox(
                                        //   height: 20,
                                        // ),
                                        // AddText(
                                        //   textAlign: TextAlign.left,
                                        //   data: q.question,
                                        //   textSize: 20,
                                        //   textWeight: FontWeight.w700,
                                        // ),
                                        // const SizedBox(
                                        //   height: 20,
                                        // ),
                                        // for (var text in q.options)
                                        //   Container(
                                        //     height: MySize.size60,
                                        //     width: MySize.size370,
                                        //     decoration: BoxDecoration(
                                        //       border: Border.all(
                                        //           width: 1,
                                        //           color: AppColors.greyDivider),
                                        //       borderRadius:
                                        //           const BorderRadius.all(
                                        //         Radius.circular(15),
                                        //       ),
                                        //     ),
                                        //     child: Padding(
                                        //       padding: EdgeInsets.symmetric(
                                        //           horizontal: MySize.size15),
                                        //       child: Row(
                                        //         children: [
                                        //           AddText(
                                        //             data: text,
                                        //             textSize: 16,
                                        //             textWeight: FontWeight.w400,
                                        //             color:
                                        //                 AppColors.greyTextColor,
                                        //           ),
                                        //           Expanded(child: Container()),
                                        //           // Radio<SingingCharacter>(
                                        //           //     value:
                                        //           //         SingingCharacter.jefferson,
                                        //           //     groupValue: _character,
                                        //           //     onChanged:
                                        //           //         (SingingCharacter? value) {
                                        //           //       setState(() {
                                        //           //         _character = value!;
                                        //           //       });
                                        //           //     })
                                        //           Container(
                                        //             height: MySize.size26,
                                        //             width: MySize.size26,
                                        //             decoration: BoxDecoration(
                                        //                 border: Border.all(
                                        //                     width: 1,
                                        //                     color: AppColors
                                        //                         .greyTextColor),
                                        //                 borderRadius:
                                        //                     BorderRadius.all(
                                        //                         Radius.circular(
                                        //                             100))),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ),
                                        // const SizedBox(
                                        //   height: 15,
                                        // ),
                                      ],
                                    ),
                                  ))),
                          // SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
