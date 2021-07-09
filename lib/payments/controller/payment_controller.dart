import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/payments/model/payments.dart';
import 'package:grocery/payments/repository/payment_repo.dart';

var paymentControllerProvider = Provider((ref) => PaymentController(ref.watch(paymentRepoProvider)));
var paymentDataFutureProvider = FutureProvider.family<List<Payment>, int >((ref, id) => ref.watch(paymentControllerProvider).getPaymentData(id));

class PaymentController {
  PaymentController(this.repo);

  PaymentRepo repo;

  Future<List<Payment>> getPaymentData(id) async {
    var response = await repo.getPaymentData(id);
    var dataList = response.data as List;

    return dataList.map((e) => Payment.fromJson(e)).toList();
  }
}
