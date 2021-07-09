import 'package:dio/dio.dart';

abstract class SupportApi{

  Future<Response> getSupportData();
  Future<Response> addTicket(type,description,title);

}