import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/consumptions/model/consumption_model.dart';
import 'package:grocery/consumptions/remote/consumption_repo.dart';

var consumptionControllerProvider = Provider((ref) => ConsumptionController(ref.watch(consumptionRepoProvider)));
var consumptionDataFutureProvider =
FutureProvider.family.autoDispose<List<ConsumptionModel>,String>((ref,id) => ref.watch(consumptionControllerProvider).getConsumptionData(id));
class ConsumptionController {
  ConsumptionController(this.repo);

  ConsumptionRepo repo;

  Future<List<ConsumptionModel>> getConsumptionData(id) async {
    var response = await repo.getConsumptionData(id);
    var dataList = response.data as List;

    return dataList.map((e) => ConsumptionModel.fromJson(e)).toList();

  }
}
