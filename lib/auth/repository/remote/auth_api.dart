import 'package:dio/dio.dart';

abstract class AuthApi{
  Future<Response> login(String email,String password);
  Future<Response> forgetPassword(String email);




}