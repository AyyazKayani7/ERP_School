class CourseDetail {
  String? courseName;
  DateTime? startTime;
  DateTime? endTime;
  String? teacherName;
  String? periodNo;
  int? lunchBreakStatus;

  CourseDetail(
      {this.courseName,
      this.startTime,
      this.endTime,
      this.teacherName,
      this.periodNo,
      this.lunchBreakStatus});

  CourseDetail.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    teacherName = json['teacherName'];
    periodNo = json['periodNo'];
    lunchBreakStatus = json['lunchBreakStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseName'] = courseName;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['teacherName'] = teacherName;
    data['periodNo'] = periodNo;
    data['lunchBreakStatus'] = lunchBreakStatus;
    return data;
  }
}
