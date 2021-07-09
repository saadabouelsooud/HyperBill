import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/payments/model/payments.dart';
import 'package:grocery/payments/repository/payment_repo.dart';
import 'package:grocery/prices/repository/prices_repo.dart';

var pricesControllerProvider = Provider((ref) => PaymentController(ref.watch(pricesRepoProvider)));
var  pricesDataFutureProvider = FutureProvider.family<List<Payment>, int >((ref, id) => ref.watch(pricesControllerProvider).getPricesData(id));

class PaymentController {
  PaymentController(this.repo);

  PricesRepo repo;

  Future<List<Payment>> getPricesData(id) async {
    var response = await repo.getPricesData(id);
    var dataList = response as List;

    return dataList.map((e) => Payment.fromJson(e)).toList();
  }

}
