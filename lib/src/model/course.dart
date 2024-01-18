class Course {
  String? courseName;
  int? obtainedMarks;
  int? totalMarks;
  Course();
  Course.setCourse({
    this.courseName,
    this.obtainedMarks,
    this.totalMarks,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course.setCourse(
      courseName: json['course'] as String?,
      obtainedMarks: json['obtained'] as int?,
      totalMarks: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course': courseName,
      'obtained': obtainedMarks,
      'total': totalMarks,
    };
  }
}
