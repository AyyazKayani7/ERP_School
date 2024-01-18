import 'package:erp_school/src/provider/quizProvider1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class QuizResult extends StatefulWidget {
  int score;
  QuizResult({super.key, required this.score});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);

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
              child: Container(
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
                              data: 'Quiz Result',
                              color: Colors.white,
                              textSize: MySize.size20,
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColors.appGradient1, AppColors.appGradient2]),
                ),
                child: Center(
                  child: AddText(
                    data: "Your score is " + widget.score.toString(),
                    textSize: 30,
                    textWeight: FontWeight.w700,
                    color: Colors.white,
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
