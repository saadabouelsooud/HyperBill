class MeterModel {
  MeterModel({
    this.meterId,
    this.serial,
    this.unitNo,
    this.customerNameEn,
    this.customerNameAr,
    this.customerDisplayName,
  });

  int meterId;
  String serial;
  String unitNo;
  String customerNameEn;
  String customerNameAr;
  dynamic customerDisplayName;

  factory MeterModel.fromJson(Map<String, dynamic> json) => MeterModel(
    meterId: json["meterId"],
    serial: json["serial"],
    unitNo: json["unitNo"],
    customerNameEn: json["customerNameEN"],
    customerNameAr: json["customerNameAR"],
    customerDisplayName: json["customerDisplayName"],
  );

  Map<String, dynamic> toJson() => {
    "meterId": meterId,
    "serial": serial,
    "unitNo": unitNo,
    "customerNameEN": customerNameEn,
    "customerNameAR": customerNameAr,
    "customerDisplayName": customerDisplayName,
  };
}

class MeterDetailModel {
  MeterDetailModel({
    this.meterId,
    this.balance,
    this.status,
    this.totalConsumption,
    this.lastReadingDate,
    this.thisMonthConsumptionEgp,
    this.thisMonthConsumptionKwh,
  });

  int meterId;
  double balance;
  bool status;
  double totalConsumption;
  DateTime lastReadingDate;
  int thisMonthConsumptionEgp;
  double thisMonthConsumptionKwh;

  factory MeterDetailModel.fromJson(Map<String, dynamic> json) => MeterDetailModel(
    meterId: json["meterId"],
    balance: json["balance"],
    status: json["status"],
    totalConsumption: json["totalConsumption"].toDouble(),
    lastReadingDate: DateTime.parse(json["lastReadingDate"]),
    thisMonthConsumptionEgp: json["thisMonthConsumptionEGP"],
    thisMonthConsumptionKwh: json["thisMonthConsumptionKWH"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "meterId": meterId,
    "balance": balance,
    "status": status,
    "totalConsumption": totalConsumption,
    "lastReadingDate": lastReadingDate.toIso8601String(),
    "thisMonthConsumptionEGP": thisMonthConsumptionEgp,
    "thisMonthConsumptionKWH": thisMonthConsumptionKwh,
  };
}
