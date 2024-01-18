import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class EventProgram {
  String? eventName;
  String? details;
  DateTime? dateTime;
  String? image;
  EventProgram();
  EventProgram.setEvent(
      {required this.eventName,
      required this.details,
      required this.dateTime,
      required this.image});

  factory EventProgram.fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json['dateTime'];
    //print(json);
    return EventProgram.setEvent(
      eventName: json['eventName'] as String?,
      details: json['details'] as String?,
      //dateTime: json['date'] != null ? DateTime.parse(json['date']) : null,
      dateTime: timestamp.toDate(),
      image: json['image'] as String?,
    );
  }
}
