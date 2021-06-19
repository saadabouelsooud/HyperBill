// import 'dart:async';
// import 'dart:convert';
// import 'package:ex_project/auth/model/response_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import '../preference/preference.dart';
//
//
//
// class AuthenticationService {
//   User _user;
//
//   User get user => _user;
//
//   AuthenticationService() {
//     loadUser;
//   }
//
//   /*
//   * Sign up user
//   */
//   Future<void> signUp({@required User user}) async {
//     try {
//       _user = user; //🦄TODO signUp implementation
//       if (_user != null) {
//         // Logger().i(_user.toJson());
//         saveUser(user: _user);
//         saveUserToken(token: _user.token);
//       }
//     } catch (e) {
//       Logger().e(e);
//     }
//   }
//
//   /*
//    * authenticate user by his phone number and password
//    */
//   Future<void> login(
//       {@required User user
//      }) async {
//     try {
//        _user = user; //TODO login implementation
//
//       if (_user != null) {
//         // Logger().i(_user.toJson());
//         saveUser(user: _user);
//         saveUserToken(token: _user.token);
//       }
//     } catch (e) {
//       Logger().e(e);
//     }
//   }
//
//   /*
//    * Update user profile info
//    */
//   Future<void> updateUserProfile(
//       {@required String fullName,
//       @required String email,
//       @required String mobile,
//       String password}) async {
//     try {
//       //TODO update profile implementation
//     } catch (e) {
//       Logger().e(e);
//     }
//   }
//
//   /*
//    *check if user is authenticated
//    */
//   bool get userLoged => Preference.getBool(PrefKeys.userLogged) ?? false;
//
//   /*
//    *save user in shared prefrences
//    */
//   saveUser({User user}) {
//     Preference.setBool(PrefKeys.userLogged, true);
//     Preference.setString(PrefKeys.userData, json.encode(user.toJson()));
//   }
//
//   /*
//    *save user token in shared prefrences
//    */
//   saveUserToken({String token}) {
//     Preference.setString(PrefKeys.token, token);
//   }
//
//   /*
//    * load the user info from shared prefrence if existed to be used in the service
//    */
//   Future<void> get loadUser async {
//     if (userLoged) {
//       _user =
//           User.fromJson(json.decode(Preference.getString(PrefKeys.userData)));
//       Logger().i(_user.toJson());
//       print('\n\n\n');
//     }
//   }
//
//   /*
//    * signout the user from the app and return to the login screen
//    */
//   Future<void> get signOut async {
//     await Preference.remove(PrefKeys.userData);
//     await Preference.remove(PrefKeys.userLogged);
//     await Preference.remove(PrefKeys.fcmToken);
//     await Preference.remove(PrefKeys.token);
//
//     _user = null;
//   }
//
//   static handleAuthExpired({@required BuildContext context}) async {
//     if (context != null) {
//       try {
//         await Preference.clear();
//
//         // UI.pushReplaceAll(context, DoctorRoutes.splash);
//
//         Logger().i('🦄session destroyed🦄');
//       } catch (e) {
//         Logger().v('🦄error while destroying session $e🦄');
//       }
//     }
//   }
// }
