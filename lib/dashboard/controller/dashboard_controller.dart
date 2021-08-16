import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/dashboard/model/meter_model.dart';
import 'package:grocery/dashboard/repository/dashboad_repo.dart';

var dashboardControllerProvider = Provider((ref) => DashboardController(ref.watch(dashBoardRepoProvider)));
var dashboardMeterDataFutureProvider = FutureProvider<List<MeterModel>>((ref) => ref.watch(dashboardControllerProvider).getDashboardData());
var dashboardMeterDetailsDataFutureProvider =
    FutureProvider.family<MeterDetailModel, int>((ref, id) => ref.watch(dashboardControllerProvider).getMeterDetailData(id));

var counterProvider = StateProvider<int>((ref) => 1);

class DashboardController {
  DashboardController(this.repo);

  DashboardRepo repo;

  Future<List<MeterModel>> getDashboardData() async {
    var response = await repo.getDashBoardData();

    var dataList = response.data as List;
    return dataList.map((e) => MeterModel.fromJson(e)).toList();
  }

  Future<MeterDetailModel> getMeterDetailData(id) async {
    var response = await repo.getMeterDetailData(id);

    return MeterDetailModel.fromJson(response.data);
  }
}
