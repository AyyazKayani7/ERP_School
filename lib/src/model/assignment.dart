class Assignment {
  String? title;
  DateTime? assignDate;
  DateTime? submissionDate;
  String? course;
  int? status;

  Assignment(
      {this.title,
      this.assignDate,
      this.submissionDate,
      this.course,
      this.status});

  Assignment.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    assignDate = json['assignDate'];
    submissionDate = json['submissionDate'];
    course = json['course'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['assignDate'] = assignDate;
    data['submissionDate'] = submissionDate;
    data['course'] = course;
    data['status'] = status;
    return data;
  }
}
