import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/recharge/model/recharge_model.dart';
import 'package:grocery/recharge/repository/recharge_repo.dart';

var rechargeControllerProvider = Provider((ref) => RechargeController(ref.watch(rechargeRepoProvider)));
var payControllerProvider = FutureProvider.family<RechargeModel,MyParameter>((ref,id) => ref.watch(rechargeControllerProvider).getPaymentData(id));

class RechargeController {
  RechargeController(this.repo);

  RechargeRepo repo;

  Future<RechargeModel> getPaymentData(MyParameter myParameter) async {
    var response = await repo.getRechargeData(myParameter);

    return  RechargeModel.fromJson(response.data);
  }
}
