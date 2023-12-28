import 'package:erp_school/src/model/courseDetail.dart';
import 'package:erp_school/src/model/DailyTimeTable.dart';
import 'package:flutter/material.dart';

class CourseProvider with ChangeNotifier {
  List<CourseDetail> _cd = [];
  List<CourseDetail> get completeCourse => _cd;

  void setCourseDetails(List<CourseDetail> c) {
    _cd = c;
    notifyListeners();
  }

  void clear() {
    _cd.clear();
    notifyListeners();
  }
}
