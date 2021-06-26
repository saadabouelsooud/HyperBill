import 'package:dio/dio.dart';
import 'package:grocery/consumptions/remote/remote/consumption_api.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var consumptionRepoProvider = Provider((ref) => ConsumptionRepo());

class ConsumptionRepo implements ConsumptionApi {
  @override
  Future<Response> getConsumptionData() async {
    var request = await HttpApi.request(EndPoint.consumptions);
    return request;
  }


}
