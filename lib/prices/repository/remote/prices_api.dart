import 'package:dio/dio.dart';

abstract class PricesApi{

  Future<Response> getPricesData(id);

}