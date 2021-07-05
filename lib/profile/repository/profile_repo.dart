import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/profile/repository/remote/profile_api.dart';

var profileRepProvider = Provider((ref) => ProfileRepo());

class ProfileRepo implements ProfileApi {
  var token = Preference.getString(PrefKeys.token);


  @override
  Future<Response> getProfileData()async {
    var request = await HttpApi.request(EndPoint.profile,headers:Header.userAuth(token));
    return request;
  }
}
