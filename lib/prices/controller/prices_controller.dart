
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/prices/repository/prices_repo.dart';

var pricesControllerProvider = Provider((ref) => PaymentController(ref.watch(pricesRepoProvider)));
var pricesDataFutureProvider = FutureProvider.family<List<List<dynamic>>, int>((ref, id) => ref.watch(pricesControllerProvider).getPricesData(id));

class PaymentController {
  PaymentController(this.repo);

  PricesRepo repo;
  List<List<dynamic>> priceModelFromJson(dynamic str) => List<List<dynamic>>.from(str.map((x) => List<dynamic>.from(x.map((x) => x))));

  Future<List<List<dynamic>>> getPricesData(id) async {
    var response = await repo.getPricesData(id);
  return  priceModelFromJson(response.data);



  }

}
