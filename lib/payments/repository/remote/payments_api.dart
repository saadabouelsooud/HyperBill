import 'package:dio/dio.dart';

abstract class PaymentApi{

  Future<Response> getPaymentData(id);

}