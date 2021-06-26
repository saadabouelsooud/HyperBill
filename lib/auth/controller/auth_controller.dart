import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/auth/repository/auth_repo.dart';
import 'package:grocery/core/services/preference/preference.dart';
import 'package:grocery/core/utils/extensions/string_methods.dart';

var authControllerProvider = Provider((ref) => AuthController(ref.watch(authRepProvider)));

class AuthController {
  String message;
  AuthRepo repo;

  AuthController(this.repo);

  var isUserLogged = Preference.getBool(PrefKeys.userLogged);

  Future<bool> login(email, pass) async {
    var response = await repo.login(email, pass);
    var json = response.data;
    if (json is Map<String, dynamic>) {
      var token = json["id_token"];
      Preference.setString(PrefKeys.token, token);
      Preference.setBool(PrefKeys.userLogged, true);
    } else {
      var e = jsonDecode(json);
      message = e["title"];
      return false;
    }
    return true;
  }

  Future<void> forgetPassword(email) async {
    var response = await repo.forgetPassword(email);
  }

  bool isLoginValidation(String email, String password) {
    if (email == null || email.isEmpty) {
      message = "please write your Email";
      return false;
    }
    if (!StringMethods(email).isEmail()) {
      message = "please write correct Email";
      return false;
    }

    if (password == null || password.isEmpty) {
      message = "please write your password";
      return false;
    }
    message = "";
    return true;
  }
}
