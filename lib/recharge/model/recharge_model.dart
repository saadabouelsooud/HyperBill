
import 'package:equatable/equatable.dart';

class RechargeModel {
  RechargeModel({
    this.mid,
    this.orderId,
    this.amount,
    this.formattedAmt,
    this.currency,
    this.hash,
    this.redirectUrl,
  });

  String mid;
  String orderId;
  double amount;
  String formattedAmt;
  String currency;
  String hash;
  String redirectUrl;

  factory RechargeModel.fromJson(Map<String, dynamic> json) => RechargeModel(
    mid: json["mid"],
    orderId: json["orderId"],
    amount: json["amount"].toDouble(),
    formattedAmt: json["formattedAmt"],
    currency: json["currency"],
    hash: json["hash"],
    redirectUrl: json["redirectURL"],
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "orderId": orderId,
    "amount": amount,
    "formattedAmt": formattedAmt,
    "currency": currency,
    "hash": hash,
    "redirectURL": redirectUrl,
  };
}

class MyParameter extends Equatable  {
  MyParameter({
     this.id,
     this.amout,
  });

  final String id;
  final String amout;

  @override
  List<Object> get props => [id, amout];
}


class PaymentSuccessModel {
  PaymentSuccessModel({
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

  factory PaymentSuccessModel.fromJson(Map<String, dynamic> json) => PaymentSuccessModel(
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
