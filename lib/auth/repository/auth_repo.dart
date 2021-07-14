import 'package:dio/dio.dart';
import 'package:grocery/auth/repository/remote/auth_api.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var authRepProvider = Provider((ref) => AuthRepo());

class AuthRepo implements AuthApi {
  @override
  Future<Response> forgetPassword(String email) async {
    var request = await HttpApi.request(EndPoint.forget, type: RequestType.Post, body: email);
    return request;
  }

  @override
  Future<Response> login(String email, String password) async {
    var request = await HttpApi.request(EndPoint.authenticate,
        type: RequestType.Post, body: {"username": email, "password": password});




    return request;
  }
}
