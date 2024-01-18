import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  int _index = 0;

  int get getIndex => _index;
  void setIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
