

class Result {
  int? englishTotal;
  int? englishObtained;
  int? hindiTotal;
  int? hindiObtained;
  int? scienceTotal;
  int? scienceObtained;
  int? mathTotal;
  int? mathObtained;
  int? socialStudyTotal;
  int? socialStudyObtained;
  int? drawingTotal;
  int? drawingObtained;
  int? computerTotal;
  int? computerObtained;

  String? englishGrade;
  String? hindiGrade;
  String? scienceGrade;
  String? mathGrade;
  String? socialStudyGrade;
  String? drawingGrade;
  String? computerGrade;
  Result({
    this.englishTotal,
    this.englishObtained,
    this.hindiTotal,
    this.hindiObtained,
    this.scienceTotal,
    this.scienceObtained,
    this.mathTotal,
    this.mathObtained,
    this.socialStudyTotal,
    this.socialStudyObtained,
    this.drawingTotal,
    this.drawingObtained,
    this.computerTotal,
    this.computerObtained,
    this.englishGrade,
    this.hindiGrade,
    this.scienceGrade,
    this.mathGrade,
    this.socialStudyGrade,
    this.drawingGrade,
    this.computerGrade,
  });
  void setGrades(
      int englishObtained,
      int hindiObtained,
      int scienceObtained,
      int mathObtained,
      int socialStudyObtained,
      int drawingObtained,
      int computerObtained) {
    if (englishObtained >= 80) {
      englishGrade = 'A';
    } else if (englishObtained >= 65 && englishObtained < 80) {
      englishGrade = 'B';
    } else if (englishObtained >= 50 && englishObtained < 65) {
      englishGrade = 'C';
    } else if (englishObtained >= 40 && englishObtained < 50) {
      englishGrade = 'D';
    } else {
      englishGrade = 'F';
    }

    if (hindiObtained >= 80) {
      hindiGrade = 'A';
    } else if (hindiObtained >= 65 && hindiObtained < 80) {
      hindiGrade = 'B';
    } else if (hindiObtained >= 50 && hindiObtained < 65) {
      hindiGrade = 'C';
    } else if (hindiObtained >= 40 && hindiObtained < 50) {
      hindiGrade = 'D';
    } else {
      hindiGrade = 'F';
    }

    if (scienceObtained >= 80) {
      scienceGrade = 'A';
    } else if (scienceObtained >= 65 && scienceObtained < 80) {
      scienceGrade = 'B';
    } else if (scienceObtained >= 50 && scienceObtained < 65) {
      scienceGrade = 'C';
    } else if (scienceObtained >= 40 && scienceObtained < 50) {
      scienceGrade = 'D';
    } else {
      scienceGrade = 'F';
    }

    if (mathObtained >= 80) {
      mathGrade = 'A';
    } else if (mathObtained >= 65 && mathObtained < 80) {
      mathGrade = 'B';
    } else if (mathObtained >= 50 && mathObtained < 65) {
      mathGrade = 'C';
    } else if (mathObtained >= 40 && mathObtained < 50) {
      mathGrade = 'D';
    } else {
      mathGrade = 'F';
    }

    if (socialStudyObtained >= 80) {
      socialStudyGrade = 'A';
    } else if (socialStudyObtained >= 65 && socialStudyObtained < 80) {
      socialStudyGrade = 'B';
    } else if (socialStudyObtained >= 50 && socialStudyObtained < 65) {
      socialStudyGrade = 'C';
    } else if (socialStudyObtained >= 40 && socialStudyObtained < 50) {
      socialStudyGrade = 'D';
    } else {
      socialStudyGrade = 'F';
    }

    if (drawingObtained >= 80) {
      drawingGrade = 'A';
    } else if (drawingObtained >= 65 && drawingObtained < 80) {
      drawingGrade = 'B';
    } else if (drawingObtained >= 50 && drawingObtained < 65) {
      drawingGrade = 'C';
    } else if (drawingObtained >= 40 && drawingObtained < 50) {
      drawingGrade = 'D';
    } else {
      drawingGrade = 'F';
    }

    if (computerObtained >= 80) {
      computerGrade = 'A';
    } else if (computerObtained >= 65 && computerObtained < 80) {
      computerGrade = 'B';
    } else if (computerObtained >= 50 && computerObtained < 65) {
      computerGrade = 'C';
    } else if (computerObtained >= 40 && computerObtained < 50) {
      computerGrade = 'D';
    } else {
      computerGrade = 'F';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'englishTotal': englishTotal,
      'englishObtained': englishObtained,
      'hindiTotal': hindiTotal,
      'hindiObtained': hindiObtained,
      'scienceTotal': scienceTotal,
      'scienceObtained': scienceObtained,
      'mathTotal': mathTotal,
      'mathObtained': mathObtained,
      'socialStudyTotal': socialStudyTotal,
      'socialStudyObtained': socialStudyObtained,
      'drawingTotal': drawingTotal,
      'drawingObtained': drawingObtained,
      'computerTotal': computerTotal,
      'computerObtained': computerObtained,
    };
  }

  Result.fromJson(Map<String, dynamic> json)
      : englishTotal = json['englishTotal'],
        englishObtained = json['englishObtained'],
        hindiTotal = json['hindiTotal'],
        hindiObtained = json['hindiObtained'],
        scienceTotal = json['scienceTotal'],
        scienceObtained = json['scienceObtained'],
        mathTotal = json['mathTotal'],
        mathObtained = json['mathObtained'],
        socialStudyTotal = json['socialStudyTotal'],
        socialStudyObtained = json['socialStudyObtained'],
        drawingTotal = json['drawingTotal'],
        drawingObtained = json['drawingObtained'],
        computerTotal = json['computerTotal'],
        computerObtained = json['computerObtained'];
}
