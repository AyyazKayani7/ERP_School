import 'package:erp_school/src/provider/quizProvider1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quizProvider.dart';
import '../utilities/colors.dart';
import '../utilities/mySize.dart';
import 'addText.dart';

class QuizQuestionCard extends StatefulWidget {
  const QuizQuestionCard({super.key});

  @override
  State<QuizQuestionCard> createState() => _QuizQuestionCardState();
}

class _QuizQuestionCardState extends State<QuizQuestionCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySize.size15, vertical: MySize.size5),
      child: Consumer<QuizProvider>(
        builder: (context, p, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            AddText(
              textAlign: TextAlign.left,
              data: p.questions[p.currentQuestionIndex].question,
              textSize: 20,
              textWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                p.questions[p.currentQuestionIndex].options.length,
                (index) {
                  //debugPrint(q.options.toString());
                  //String text = questions.options[].to;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      height: MySize.size60,
                      width: MySize.size370,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyDivider,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: MySize.size15),
                        child: Row(
                          children: [
                            AddText(
                              data: p.questions[p.currentQuestionIndex]
                                  .options[index],
                              textSize: 16,
                              textWeight: FontWeight.w400,
                              color: AppColors.greyTextColor,
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                if (p.questions[p.currentQuestionIndex]
                                        .optionSelected ==
                                    0) {
                                  p.questions[p.currentQuestionIndex]
                                      .optionSelected = 1;
                                } else if (p.questions[p.currentQuestionIndex]
                                        .optionSelected ==
                                    1) {
                                  p.questions[p.currentQuestionIndex]
                                      .optionSelected = 0;
                                } else {
                                  p.questions[p.currentQuestionIndex]
                                      .optionSelected = 3;
                                }

                                p.ac = true;
                                if (p.questions[p.currentQuestionIndex]
                                        .correctOptionIndex ==
                                    index) {
                                  p.setcorrectAnswer(1);
                                  p.setSelectedAnswer(index);
                                } else {
                                  p.setcorrectAnswer(2);
                                }
                              },
                              child: Container(
                                height: MySize.size26,
                                width: MySize.size26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: p.getColor(p
                                          .questions[p.currentQuestionIndex]
                                          .optionSelected)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
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
          ],
        ),
      ),
    );
  }
}
