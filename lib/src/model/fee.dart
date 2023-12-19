class Fee {
  String? receiptNo;
  DateTime? paymentDate;
  int? status;
  int? totalAmount;

  Fee({this.receiptNo, this.paymentDate, this.status, this.totalAmount});

  Fee.fromJson(Map<String, dynamic> json) {
    receiptNo = json['receiptNo'];
    paymentDate = json['paymentDate'];
    status = json['status'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiptNo'] = receiptNo;
    data['paymentDate'] = paymentDate;
    data['status'] = status;
    data['totalAmount'] = totalAmount;
    return data;
  }
}
