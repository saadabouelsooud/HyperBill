
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

class PaymentModel {
  PaymentModel({
    this.paymentStatus,
    this.cardDataToken,
    this.maskedCard,
    this.merchantOrderId,
    this.orderId,
    this.cardBrand,
    this.orderReference,
    this.transactionId,
    this.amount,
    this.currency,
    this.signature,
    this.mode,
  });

  String paymentStatus;
  String cardDataToken;
  String maskedCard;
  String merchantOrderId;
  String orderId;
  String cardBrand;
  String orderReference;
  String transactionId;
  String amount;
  String currency;
  String signature;
  String mode;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    paymentStatus: json["paymentStatus"],
    cardDataToken: json["cardDataToken"],
    maskedCard: json["maskedCard"],
    merchantOrderId: json["merchantOrderId"],
    orderId: json["orderId"],
    cardBrand: json["cardBrand"],
    orderReference: json["orderReference"],
    transactionId: json["transactionId"],
    amount: json["amount"],
    currency: json["currency"],
    signature: json["signature"],
    mode: json["mode"],
  );

  Map<String, dynamic> toJson() => {
    "paymentStatus": paymentStatus,
    "cardDataToken": cardDataToken,
    "maskedCard": maskedCard,
    "merchantOrderId": merchantOrderId,
    "orderId": orderId,
    "cardBrand": cardBrand,
    "orderReference": orderReference,
    "transactionId": transactionId,
    "amount": amount,
    "currency": currency,
    "signature": signature,
    "mode": mode,
  };
}
