import 'package:erp_school/src/model/DailyTimeTable.dart';
import 'package:intl/intl.dart';

class WeeklyTimeTable {
  List<DailyTimeTable>? dt;
  WeeklyTimeTable(this.dt);
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> listOfDailyTimeTables =
        dt!.map((dailyTimeTable) {
      return dailyTimeTable.toJson();
    }).toList();
    return {'listOfDailyTimeTables': listOfDailyTimeTables};
  }

  WeeklyTimeTable.fromJson(Map<String, dynamic> json) {
    dt = json['cl'];
  }
}
