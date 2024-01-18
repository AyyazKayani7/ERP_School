import 'result.dart';

class StudentResultDetails {
  String? name;
  int? age;
  Result? result;
  StudentResultDetails();

  StudentResultDetails.setValues(this.name, this.age, this.result);

  setResult(Result r) {
    result = r;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'result': {
        'englishTotal': result!.englishTotal,
        'englishObtained': result!.englishObtained,
        'hindiTotal': result!.hindiTotal,
        'hindiObtained': result!.hindiObtained,
        'scienceTotal': result!.scienceTotal,
        'scienceObtained': result!.scienceObtained,
        'mathTotal': result!.mathTotal,
        'mathObtained': result!.mathObtained,
        'socialStudyTotal': result!.socialStudyTotal,
        'socialStudyObtained': result!.socialStudyObtained,
        'drawingTotal': result!.drawingTotal,
        'drawingObtained': result!.drawingObtained,
        'computerTotal': result!.computerTotal,
        'computerObtained': result!.computerObtained,
      }
    };
  }
}
