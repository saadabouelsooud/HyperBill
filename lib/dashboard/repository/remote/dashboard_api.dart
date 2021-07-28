import 'package:dio/dio.dart';
import 'package:grocery/core/services/api/wrapper_model.dart';

abstract class DashboardApi{

  Future<Response> getDashBoardData();
  Future<Response> getMeterDetailData(id);
  Result<Response> getMeterDetail();




}