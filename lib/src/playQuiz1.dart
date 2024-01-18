import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:erp_school/src/model/QuizQuestion.dart';
import 'package:erp_school/src/provider/quizProvider.dart';
import 'package:erp_school/src/provider/quizProvider1.dart';
import 'package:erp_school/src/quizResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:provider/provider.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class PlayQuiz1 extends StatefulWidget {
  const PlayQuiz1({super.key});

  @override
  State<PlayQuiz1> createState() => _PlayQuiz1State();
}

enum SingingCharacter { lafayette, jefferson }

class _PlayQuiz1State extends State<PlayQuiz1> with TickerProviderStateMixin {
  late LinearTimerController timerController = LinearTimerController(this);
  late Timer timer;
  startTimer() {}

  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   if (mounted) {
    //     QuizProvider1 quizProvider1 =
    //         Provider.of<QuizProvider1>(context, listen: false);
    //     quizProvider1.setSeconds(60);

    //     timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //       if (mounted) {
    //         quizProvider1.setSeconds(quizProvider1.second - 1);
    //       }
    //     });
    //   }
    // });

    //startTimer();
    QuizProvider1 quizProvider1 =
        Provider.of<QuizProvider1>(context, listen: false);
    quizProvider1.startTimer(context);
    // timerController.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //timer.cancel();
    // QuizProvider1 quizProvider1 =
    //     Provider.of<QuizProvider1>(context, listen: false);
    // //quizProvider1.timer1!.cancel();
    // if (quizProvider1.timer1 != null) {
    //   quizProvider1.timer1!.cancel();
    // } else {
    //   print('aaaaaaaaaaaaaaaaaaaaa');
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //   LinearTimerController _timerController = LinearTimerController(
    // duration: const Duration(seconds: 10), // Set the duration of the timer
//);

    SingingCharacter _character = SingingCharacter.lafayette;
    int seconds = 60;
    var optionList = [];
    return WillPopScope(
      onWillPop: () async {
        QuizProvider1 quizProvider1 =
            Provider.of<QuizProvider1>(context, listen: false);
        if (quizProvider1.timer1 != null) {
          Future.delayed(const Duration(seconds: 1), () {
            quizProvider1.setSeconds(10);
            quizProvider1.setCurrentQuestionIndex(0);
            quizProvider1.setScore(0);
            quizProvider1.timer1!.cancel();
          });
          // Timer.periodic(Duration(seconds: 1), (timer) {
          //   quizProvider1.setSeconds(60);
          //   quizProvider1.timer1!.cancel();
          // });
        } else {
          print('aaaaaaaaaaaaaaaaaaaaa');
        }
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05
                        //MySize.size18
                        ),
                    width: width * 0.9, //MySize.size360,
                    child: GestureDetector(
                      onTap: () {
                        QuizProvider1 quizProvider1 =
                            Provider.of<QuizProvider1>(context, listen: false);
                        //quizProvider1.timer1!.cancel();
                        if (quizProvider1.timer1 != null) {
                          Future.delayed(const Duration(seconds: 1), () {
                            quizProvider1.setCurrentQuestionIndex(0);
                            quizProvider1.setScore(0);
                            quizProvider1.setSeconds(10);
                            quizProvider1.timer1!.cancel();
                          });
                          // Timer.periodic(Duration(seconds: 1), (timer) {
                          //   quizProvider1.setSeconds(60);
                          //   quizProvider1.timer1!.cancel();
                          // });
                        } else {
                          print('aaaaaaaaaaaaaaaaaaaaa');
                        }
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
                            data: 'Play Quiz',
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: AppColors
                                              .progressTimeBarBackground),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    child: Consumer<QuizProvider1>(
                                      builder: (context, value, child) =>
                                          LinearTimer(
                                        //forward: false,
                                        //controller: ,
                                        color: AppColors.progressTimeBar,
                                        backgroundColor:
                                            AppColors.progressTimeBarBackground,
                                        minHeight: 30,
                                        //controller: timerController,
                                        duration:
                                            Duration(seconds: value.second),
                                      ),
                                    ),
                                  ),
                                ),
                                Consumer<QuizProvider1>(
                                  builder: (context, value, child) =>
                                      Positioned(
                                    left: 20,
                                    top: 6.5,
                                    child: AddText(
                                      data: value.second
                                          .toString(), //progressValue.toString(),
                                      textSize: 14,
                                      color: Colors.white,
                                      textWeight: FontWeight.w400,
                                    ),
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
                            )),
                        Consumer<QuizProvider1>(
                          builder: (context, value, child) => Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  value: value.second / 10,
                                  backgroundColor: Colors.red,
                                  valueColor: const AlwaysStoppedAnimation(
                                      Colors.amber),
                                ),
                              ),
                              AddText(
                                data: value.second.toString(),
                                textSize: 20,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: MySize.size30,
                        // ),
                        SizedBox(
                          height: 35,
                          child: Consumer<QuizProvider1>(
                            builder: (context, value, child) => Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AddText(
                                  data: 'Question ' +
                                      (value.currentQuestionIndex + 1)
                                          .toString(),
                                  textSize: 30,
                                  textWeight: FontWeight.w400,
                                  color: AppColors.greyMainTextFFF,
                                ),
                                SizedBox(
                                  height: 25,
                                  child: AddText(
                                    data: ' /' +
                                        value.questions.length.toString(),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
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
                                  child: Consumer<QuizProvider1>(
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (p.selectedOnce ==
                                                        false) {
                                                      p.setIndexSelected(index);
                                                      if (index ==
                                                          p
                                                              .questions[p
                                                                  .currentQuestionIndex]
                                                              .correctOptionIndex) {
                                                        p.setIcon(const Icon(
                                                          Icons.done,
                                                          color: AppColors
                                                              .correctOption,
                                                        ));
                                                        p.setScore(
                                                            p.score + 10);
                                                        p.setAfterSelectionColor(
                                                            AppColors
                                                                .correctOption);
                                                        if (p.currentQuestionIndex ==
                                                            p.questions.length -
                                                                1) {
                                                          p.timer1!.cancel();
                                                          p.setCurrentQuestionIndex(
                                                              0);
                                                          p.setSeconds(10);
                                                          // timerController
                                                          //     .reset();
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      QuizResult(
                                                                          score:
                                                                              p.score)));
                                                        }
                                                        p.moveOnNextQuestion(
                                                            context);
                                                      } else {
                                                        p.setIcon(const Icon(
                                                          Icons.close,
                                                          color: AppColors
                                                              .wrongOption,
                                                        ));
                                                        p.setAfterSelectionColor(
                                                            AppColors
                                                                .wrongOption);

                                                        p.moveOnNextQuestion(
                                                            context);
                                                      }
                                                      p.setSelectedOnce(true);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: MySize.size60,
                                                    width: MySize.size370,
                                                    decoration: BoxDecoration(
                                                      color: p.indexSelected ==
                                                              index
                                                          ? p.optionBackgroundColor
                                                          : Colors.white,
                                                      border: Border.all(
                                                        width: 1,
                                                        color: p.indexSelected ==
                                                                index
                                                            ? p.optionColor
                                                            : AppColors
                                                                .greyTextColor,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: MySize
                                                                  .size15),
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
                                                            color: p.indexSelected ==
                                                                    index
                                                                ? p.optionColor
                                                                : AppColors
                                                                    .greyTextColor,
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  Container()),
                                                          Container(
                                                            height:
                                                                MySize.size26,
                                                            width:
                                                                MySize.size26,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                width: 2,
                                                                color: p.indexSelected ==
                                                                        index
                                                                    ? p
                                                                        .optionColor
                                                                    : AppColors
                                                                        .greyTextColor,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    100),
                                                              ),
                                                            ),
                                                            child: p.indexSelected ==
                                                                        index &&
                                                                    p.selectedOnce !=
                                                                        false
                                                                ? Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    child:
                                                                        p.icon,
                                                                  )
                                                                : Container(),
                                                            // child: index ==
                                                            //         p
                                                            //             .questions[p
                                                            //                 .currentQuestionIndex]
                                                            //             .correctOptionIndex
                                                            //     ? Icon(Icons
                                                            //         .done)
                                                            //     : Icon(Icons
                                                            //         .close)
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
