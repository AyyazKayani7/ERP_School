import 'dart:async';

import 'package:erp_school/src/quizResult.dart';
import 'package:erp_school/src/utilities/colors.dart';
import 'package:flutter/material.dart';

import '../model/QuizQuestion.dart';

class QuizProvider1 with ChangeNotifier {
  List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What is the capital of France?',
      options: [
        'Berlin',
        'Madrid',
        'Paris',
        'Rome',
      ],
      correctOptionIndex: 2,
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
  Icon _icon = Icon(Icons.done);
  int _score = 0;
  int _seconds = 10;
  Timer? timer1;
  bool _selectedOnce = false;
  bool _isSelectedForSecondDelay = false;
  Color optionBackgroundColor = Colors.white;
  Color optionColor = AppColors.greyTextColor;

  Color answerColor = AppColors.greyTextColor;
  int _indexSelected = 100;
  int _currentQuestionIndex = 0;
  int _timeInSeconds = 10;
  int _totalQuestions = 5; // Replace with the total number of questions
  late Timer _timer;
  //int get timer1 => _timer1;
  Icon get icon => _icon;
  int get second => _seconds;
  int get score => _score;
  bool get selectedOnce => _selectedOnce;
  int get indexSelected => _indexSelected;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _totalQuestions;
  Timer get timer => _timer;
  int get timeInSeconds => _timeInSeconds;
  bool ac = false;
  void setScore(int value) {
    _score = value;
    notifyListeners();
  }

  void setIcon(Icon value) {
    _icon = value;
    notifyListeners();
  }

  void setSelectedOnce(bool value) {
    _selectedOnce = value;
    notifyListeners();
  }

  void setAfterSelectionColor(Color value) {
    optionColor = value;
    optionBackgroundColor = value.withOpacity(0.102);
    notifyListeners();
  }

  void setIndexSelected(int index) {
    _indexSelected = index;
    notifyListeners();
  }

  void setSeconds(int value) {
    _seconds = value;
    notifyListeners();
  }

  void setCurrentQuestionIndex(int value) {
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
      notifyListeners();
    } else {
      _timer.cancel();
      notifyListeners();
      // All questions completed
    }
  }

  // void timerCancel() {
  //   _seconds = 0;
  //   //_timer1 = 0 as Timer;
  //   timer1!.cancel();
  //   //timer1 = null;

  //   //notifyListeners();
  // }
  void moveOnNextQuestion(BuildContext context) {
    if (_currentQuestionIndex < questions.length - 1) {
      Future.delayed(Duration(seconds: 1), () {
        _currentQuestionIndex++;
        _isSelectedForSecondDelay = true;
        notifyListeners();
        optionBackgroundColor = Colors.white;
        optionColor = AppColors.greyTextColor;
        _indexSelected = 100;
        _selectedOnce = false;
        //timer.cancel();
      });
      _seconds = 10;
      notifyListeners();
    } else {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QuizResult(score: _score)));
        optionBackgroundColor = Colors.white;
        optionColor = AppColors.greyTextColor;
        _selectedOnce = false;
      });
    }
  }

  void startTimer(BuildContext context) {
    questions.shuffle();
    _selectedOnce = false;
    _score = 0;
    _seconds = 10;
    _currentQuestionIndex = 0;
    timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds != 0 && _currentQuestionIndex <= questions.length - 1) {
        // if (_isSelectedForSecondDelay == true) {
        //   Future.delayed(Duration(seconds: 1), () {});
        // }
        _seconds--;
        _isSelectedForSecondDelay = false;
        print(_score.toString());
      } else if (_seconds == 0 &&
          _currentQuestionIndex == questions.length - 1) {
        timer1!.cancel();

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QuizResult(score: _score)));
      } else {
        if (_currentQuestionIndex < questions.length - 1) {
          _currentQuestionIndex++;
          _seconds = 10;
        }
        optionBackgroundColor = Colors.white;
        optionColor = AppColors.greyTextColor;
      }
      notifyListeners();
    });
  }
}
