import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/consumptions/model/consumption_model.dart';
import 'package:grocery/consumptions/remote/consumption_repo.dart';

var consumptionControllerProvider = Provider((ref) => ConsumptionController(ref.watch(consumptionRepoProvider)));

class ConsumptionController {
  ConsumptionController(this.repo);

  ConsumptionRepo repo;

  Future<List<ConsumptionModel>> getConsumptionData() async {
    var response = await repo.getConsumptionData();
  }
}
