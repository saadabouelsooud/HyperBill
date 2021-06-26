import 'package:dio/dio.dart';
import 'package:grocery/auth/repository/remote/auth_api.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/dashboard/repository/remote/dashboard_api.dart';

var dashBoardRepoProvider = Provider((ref) => DashboardRepo());

class DashboardRepo implements DashboardApi {
  var token = Preference.getString(PrefKeys.token);

  @override
  Future<Response> getDashBoardData() async{
    var request = await HttpApi.request(EndPoint.meters,headers:Header.userAuth(token));
    return request;
  }

  @override
  Future<Response> getMeterDetailData(id) async{
    var request = await HttpApi.request(EndPoint.meters+"/"+id.toString(),headers:Header.userAuth(token));
    return request;
  }

}
