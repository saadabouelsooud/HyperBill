
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