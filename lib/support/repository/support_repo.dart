import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/core/services/api/api.dart';
import 'package:grocery/core/services/api/http_api.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/support/repository/remote/support_api.dart';


class SupportRepo implements SupportApi {
  var token = Preference.getString(PrefKeys.token);

  @override
  Future<Response> getSupportData() async {
    var request = await HttpApi.request(EndPoint.ticketList, headers: Header.userAuth(token));
    return request;
  }

  @override
  Future<Response> addTicket(type, description, title) async {
    var request = await HttpApi.request(EndPoint.tickets,
        body: {"type": type, "title": title, "description": description}, type: RequestType.Post, headers: Header.userAuth(token));
    return request;
  }
}
