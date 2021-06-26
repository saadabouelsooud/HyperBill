import 'package:dio/dio.dart';

abstract class DashboardApi{

  Future<Response> getDashBoardData();
  Future<Response> getMeterDetailData(id);




}