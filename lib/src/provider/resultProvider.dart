import 'package:flutter/material.dart';

class ResultProvider with ChangeNotifier {
  String? _grade;
  String? _remarks;
  double? _percentage;

  String get grade => _grade ?? 'grade';
  String get remarks => _remarks ?? '';
  double get percentage => _percentage ?? 0;

  void setGrade(String grade) {
    _grade = grade;
    notifyListeners();
  }

  void setRemarks(String remarks) {
    _remarks = remarks;
    notifyListeners();
  }

  void setPercentage(double percentage) {
    _percentage = percentage;
    notifyListeners();
  }

  void clear() {
    _grade = 'Grade ';
    _percentage = 0;
  }
}
