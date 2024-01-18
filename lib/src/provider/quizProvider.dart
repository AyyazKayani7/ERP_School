import 'dart:async';

import 'package:erp_school/src/utilities/colors.dart';
import 'package:flutter/material.dart';

import '../model/QuizQuestion.dart';

class QuizProvider with ChangeNotifier {
  List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What is the capital of France?',
      options: [
        'Berlin',
        'Madrid',
        'Paris',
        'Rome',
      ],
      correctOptionIndex: 3,
    ),
    QuizQuestion(
      question: 'Which planet is known as the "Red Planet"?',
      options: [
        'Jupiter',
        'Mars',
        'Saturn',
        'Venus',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Who painted the Mona Lisa?',
      options: [
        'Pablo Picasso',
        'Vincent van Gogh',
        'Leonardo da Vinci',
        'Michelangelo',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Which is the longest river in the world?',
      options: [
        'Nile',
        'Amazon',
        'Mississippi',
        'Yangtze',
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: 'What is the currency of Japan?',
      options: [
        'Dollar',
        'Euro',
        'Pound',
        'Yen',
      ],
      correctOptionIndex: 3,
    ),
  ];

  Color answerColor = AppColors
      .greyTextColor; // grey means answer not selected, green means selected and true,red means selected and false
  int _correctAnswer = 0; // 0 means option not selected, 1 true, 2 false
  int _selectedAnswer = 4; // 0 means option not selected, 1 true, 2 false
  int _currentQuestionIndex = 0;
  int _totalTime = 5;
  int _timeInSeconds = 10;
  int _totalQuestions = 5; // Replace with the total number of questions
  late Timer _timer;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _totalQuestions;
  Timer get timer => _timer;
  int get timeInSeconds => _timeInSeconds;
  int get correctAnswer => _correctAnswer;
  int get selectedAnswer => _selectedAnswer;
  bool ac = false;

  void setSelectedAnswer(int value) {
    _selectedAnswer = value;
    notifyListeners();
  }

  void setcorrectAnswer(int value) {
    _correctAnswer = value;
    notifyListeners();
  }

  Color getColor(int optionSelected) {
    if (_correctAnswer == optionSelected) {
      return Colors.green;
    } else if (_correctAnswer != optionSelected) {
      return Colors.red;
    } else {
      return AppColors.greyTextColor;
    }
  }

  void setCurrentQuestion(int value) {
    _currentQuestionIndex = value;
    notifyListeners();
  }

  void setTimeInSeconds(int value) {
    _currentQuestionIndex = value;
    notifyListeners();
  }

  void setTotalQuestions(int value) {
    _totalQuestions = value;
    notifyListeners();
  }

  void setTimer(Timer value) {
    _timer = value;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
      _totalTime = 5;
      notifyListeners();
    } else {
      _timer.cancel();
      notifyListeners();
      // All questions completed
    }
  }

  void dispose() {
    _timer.cancel();
  }

  void startTimer() {
    debugPrint(_currentQuestionIndex.toString() + "  Current Index");

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // if (_totalTime % 10 == 0 && _totalTime != _totalQuestions * 10) {
      //debugPrint(timer.toString() + '  timer');
      if (_totalTime == 0) {
        if (_currentQuestionIndex != _totalQuestions) {
          debugPrint('second: ' + _totalTime.toString());
          nextQuestion();
        } else {
          timer.cancel();
        }
        // Move to the next question when time is up
      } else {
        _totalTime--;
      }
    });
  }
}
