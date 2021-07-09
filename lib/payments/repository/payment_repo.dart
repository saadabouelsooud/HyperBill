import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/payments/repository/remote/payments_api.dart';

var paymentRepoProvider = Provider((ref) => PaymentRepo());

class PaymentRepo implements PaymentApi {
  var token = Preference.getString(PrefKeys.token);

  @override
  Future<Response> getPaymentData(id) async {
    var request = await HttpApi.request(EndPoint.payments + "/" + id.toString(), headers: Header.userAuth(token));
    return request;
  }
}
