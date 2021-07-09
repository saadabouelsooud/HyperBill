import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/support/model/ticket_model.dart';
import 'package:grocery/support/repository/support_repo.dart';

var supportControllerProvider = Provider((ref) => SupportController(ref.watch(supportRepoProvider)));
var supportDataFutureProvider = FutureProvider<List<Ticket>>((ref) => ref.watch(supportControllerProvider).getSupportData());

class SupportController {
  SupportController(this.repo);

  var message;
  SupportRepo repo;

  Future<List<Ticket>> getSupportData() async {
    var response = await repo.getSupportData();
    var dataList = response.data as List;

    return dataList.map((e) => Ticket.fromJson(e)).toList();
  }

  Future<Ticket> addTicket(type, description, title) async {
    var response = await repo.addTicket(type, description, title);

    return Ticket.fromJson(response.data);
  }
}
