import 'package:dio/dio.dart';
import 'package:grocery/recharge/model/recharge_model.dart';

abstract class RechargeApi{

  Future<Response> getRechargeData(MyParameter model);

}