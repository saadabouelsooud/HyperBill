

class Payment {
  Payment({
    this.id,
    this.paymentDate,
    this.amount,
    this.meterId,
    this.type,
    this.receiptNo,
  });

  int id;
  DateTime paymentDate;
  int amount;
  int meterId;
  String type;
  String receiptNo;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        paymentDate: DateTime.parse(json["paymentDate"]),
        amount: json["amount"],
        meterId: json["meterId"],
        type: json["type"],
        receiptNo: json["receiptNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "paymentDate": paymentDate.toIso8601String(),
        "amount": amount,
        "meterId": meterId,
        "type": type,
        "receiptNo": receiptNo,
      };
}
