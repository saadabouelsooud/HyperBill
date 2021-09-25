import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/recharge/model/recharge_model.dart';
import 'package:grocery/recharge/repository/recharge_repo.dart';

var rechargeControllerProvider = Provider((ref) => RechargeController(ref.watch(rechargeRepoProvider)));
var payControllerProvider = FutureProvider.family.autoDispose<RechargeModel, MyParameter>((ref, id) => ref.watch(rechargeControllerProvider).getPaymentData(id));
var amountProvider = StateProvider<String>((ref) => "0.0");

class RechargeController {
  RechargeController(this.repo);

  RechargeRepo repo;
  String message = "";

  Future<RechargeModel> getPaymentData(MyParameter myParameter) async {
    var response = await repo.getRechargeData(myParameter);

    return RechargeModel.fromJson(response.data);
  }

  Future<void> addSuccessRecharge(model) async {

    var response = await repo.addSuccessRecharge(model);
    if(response.statusCode==200){
      message="Payment Success";
    }
  }
}
