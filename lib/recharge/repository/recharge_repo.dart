import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/recharge/model/recharge_model.dart';
import 'package:grocery/recharge/repository/remote/recharge_api.dart';

var rechargeRepoProvider = Provider((ref) => RechargeRepo());

class RechargeRepo implements RechargeApi {
  var token = Preference.getString(PrefKeys.token);

  @override
  Future<Response> getRechargeData(MyParameter model) async {
    var request =
        await HttpApi.request(EndPoint.pay + "/" + model.id, headers: Header.userAuth(token), body: {"amount": model.amout}, type: RequestType.Post);
    return request;
  }

  @override
  Future<Response> addSuccessRecharge( model) async {
    var request = await HttpApi.request(EndPoint.finalPay, headers: Header.userAuth(token), body: model, type: RequestType.Post);
    return request;
  }
}
