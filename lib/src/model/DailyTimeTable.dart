import 'package:erp_school/src/model/courseDetail.dart';

class DailyTimeTable {
  List<CourseDetail>? cl;
  //DateTime? day;
  String? day;
  DailyTimeTable();
  DailyTimeTable.setValues(this.cl, this.day);
  DailyTimeTable.fromJson(Map<String, dynamic> json) {
    cl = json['cl'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['cl'] = cl;
    return data;
  }
}
