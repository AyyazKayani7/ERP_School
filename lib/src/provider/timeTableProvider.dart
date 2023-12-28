// ignore_for_file: file_names

import 'package:erp_school/src/model/courseDetail.dart';
import 'package:flutter/material.dart';

import '../model/DailyTimeTable.dart';

class TimeTableProvider with ChangeNotifier {
  int _index = 0; // Set initial state to loading
  List<CourseDetail> _cd = [];
  List<CourseDetail> get completeCourse => _cd;
  int get getIndex => _index;

  void setCourseDetails(List<CourseDetail> c) {
    _cd = c;
    notifyListeners();
  }

  // Method to change the loading state (e.g., when initialization is complete)
  void setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  void clear() {
    _index = 0;
    notifyListeners();
  }
}
