import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/support/model/ticket_model.dart';
import 'package:grocery/support/repository/support_repo.dart';

var supportControllerProvider =
    Provider((ref) => SupportController(ref.watch(supportRepoProvider)));
var supportDataFutureProvider = FutureProvider<List<Ticket>>(
    (ref) => ref.watch(supportControllerProvider).getSupportData());

class SupportController {
  var type;
  SupportController(this.repo);
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  String message;
  SupportRepo repo;

  Future<List<Ticket>> getSupportData() async {
    var response = await repo.getSupportData();
    var dataList = response.data as List;

    return dataList.map((e) => Ticket.fromJson(e)).toList();
  }

  Future<Ticket> addTicket(type, description, title) async {
    var response = await repo.addTicket(type, description, title);
    if (response.statusCode == 200) {
      titleTextController.clear();
      descriptionTextController.clear();
      message = "success";
      return Ticket.fromJson(response.data);
    } else {
      message = "fail";
    }

  }
}
