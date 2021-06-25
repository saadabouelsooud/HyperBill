import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/auth/repository/auth_repo.dart';
import 'package:grocery/core/services/preference/preference.dart';

var authControllerProvider = Provider((ref) => ref.watch(authRepProvider));

class AuthController {
  String message;
  AuthRepo repo;

  AuthController(this.repo);

  Future<void> login(email, pass) async {
    var response = await repo.login(email, pass);
    Map<String, dynamic> json = response.data;

    var token=json["id_token"];
    Preference.setString(PrefKeys.token, token);

  }
    Future<void> forgetPassword(email) async {
      var response = await repo.forgetPassword(email);
    }


    
  }