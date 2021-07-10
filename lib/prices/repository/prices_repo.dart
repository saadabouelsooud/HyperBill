
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/prices/repository/remote/prices_api.dart';

var pricesRepoProvider = Provider((ref) => PricesRepo());

class PricesRepo implements PricesApi {
  var token = Preference.getString(PrefKeys.token);

  @override
  Future<Response> getPricesData(id)async {

    var request = await HttpApi.request(EndPoint.prices + "/" + id.toString(), headers: Header.userAuth(token));
    return request;
  }


}
