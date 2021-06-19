import 'dart:convert';

import 'package:flutter/material.dart';

class RequestType {
  static const String Get = 'get';
  static const String Post = 'post';
  static const String Put = 'put';
  static const String Delete = 'delete';
}

class Header {
  static Map<String, dynamic> clientAuth({@required String clientID}) {
    final hashedClient = const Base64Encoder().convert("$clientID:".codeUnits);
    return {'Authorization': 'Basic $hashedClient'};
  }

  static Map<String, dynamic> userAuth(String accessToken) => {'Authorization': 'Bearer $accessToken'};
  static Map<String, dynamic> userHeader(String accessToken,String lang) => {'Authorization': 'Bearer $accessToken','lang': ' $lang'};

  static Map<String, dynamic> userNotification(String accessToken) => {'Authorization': 'Bearer $accessToken'};
  static Map<String, dynamic> userLanguage(String lang) => {'lang': ' $lang'};
}

class EndPoint {
  static const String meters = 'meters';
  static const String consumptions= 'consumptions';
  static const String payments = 'payments';
  static const String tickets  = 'tickets';
  static const String pay  = 'pay';
  static const String finalPay  = 'pay/update';
  static const String authenticate  = 'authenticate';
}
