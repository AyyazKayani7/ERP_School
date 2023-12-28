class Courses {
  String? english;
  String? hindi;
  String? science;
  String? math;
  String? socialStudy;
  String? drawing;
  String? computer;

  Courses(
      {this.english,
      this.hindi,
      this.science,
      this.math,
      this.socialStudy,
      this.drawing,
      this.computer});

  Courses.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    hindi = json['hindi'];
    science = json['science'];
    math = json['math'];
    socialStudy = json['socialStudy'];
    drawing = json['drawing'];
    computer = json['computer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english'] = english;
    data['hindi'] = hindi;
    data['science'] = science;
    data['math'] = math;
    data['socialStudy'] = socialStudy;
    data['drawing'] = drawing;
    data['computer'] = computer;
    return data;
  }
}
