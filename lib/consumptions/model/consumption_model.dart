

class ConsumptionModel {
  ConsumptionModel({
    this.id,
    this.consumptionMonth,
    this.readingDate,
    this.consumption,
    this.amount,
    this.invoiceId,
    this.meterId,
  });

  int id;
  DateTime consumptionMonth;
  DateTime readingDate;
  double consumption;
  int amount;
  dynamic invoiceId;
  int meterId;

  factory ConsumptionModel.fromJson(Map<String, dynamic> json) => ConsumptionModel(
    id: json["id"],
    consumptionMonth: DateTime.parse(json["consumptionMonth"]),
    readingDate: DateTime.parse(json["readingDate"]),
    consumption: json["consumption"].toDouble(),
    amount: json["amount"],
    invoiceId: json["invoiceId"],
    meterId: json["meterId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "consumptionMonth": "${consumptionMonth.year.toString().padLeft(4, '0')}-${consumptionMonth.month.toString().padLeft(2, '0')}-${consumptionMonth.day.toString().padLeft(2, '0')}",
    "readingDate": readingDate.toIso8601String(),
    "consumption": consumption,
    "amount": amount,
    "invoiceId": invoiceId,
    "meterId": meterId,
  };
}
