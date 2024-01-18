class Student {
  String? name;
  String? className;
  String? rollNo;
  String? adharNo;
  String? academicYear;
  String? adClass;
  String? oldAdNo;
  String? parentMail;
  String? motherName;
  String? fatherName;
  String? permanentAddress;
  String? profileImg;
  DateTime? doa; // Date of Admission
  DateTime? dob; // Date of Birth
  Student();
  Student.setValues({
    required this.name,
    required this.className,
    required this.rollNo,
    required this.adharNo,
    required this.academicYear,
    required this.adClass,
    required this.oldAdNo,
    required this.parentMail,
    required this.motherName,
    required this.fatherName,
    required this.permanentAddress,
    required this.profileImg,
    this.doa,
    this.dob,
  });
}
