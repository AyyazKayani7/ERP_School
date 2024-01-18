import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp_school/src/model/fee.dart';

class Fees {
  String? amount;
  String? payMode;
  DateTime? paymentDate;
  String? receiptNo;
  int? status;
  String? uid;
  Fees();
  Fees.setFee({
    required this.amount,
    required this.payMode,
    required this.paymentDate,
    required this.receiptNo,
    required this.status,
    required this.uid,
  });

  factory Fees.fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json['paymentDate'];
    return Fees.setFee(
      amount: json['amount'] ?? '',
      payMode: json['payMode'] ?? '',
      // Assuming 'paymentDate' is in a String format like "August 10, 2020 at 12:00:00 AM UTC+5"
      //paymentDate: DateTime.tryParse(json['paymentDate']) ?? DateTime.now(),

      // paymentDate: json['paymentDate'] ?? DateTime.now(),
      paymentDate: timestamp.toDate(),
      receiptNo: json['receiptNo'] ?? '',
      status: json['status'] ?? 2,
      uid: json['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'payMode': payMode,
      'paymentDate': DateTime.now(), //paymentDate!.toIso8601String(),
      'receiptNo': receiptNo,
      'status': status,
      'uid': uid,
    };
  }
}
