import 'package:dio/dio.dart';
import 'package:grocery/consumptions/remote/remote/consumption_api.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/preference/preference.dart';

var consumptionRepoProvider = Provider((ref) => ConsumptionRepo());

class ConsumptionRepo implements ConsumptionApi {
  var token = Preference.getString(PrefKeys.token);

  @override
  Future<Response> getConsumptionData(id) async {
    var request = await HttpApi.request(EndPoint.consumptions+id,headers:Header.userAuth(token));
    return request;
  }


}
