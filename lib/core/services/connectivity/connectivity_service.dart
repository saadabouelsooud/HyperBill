import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  bool lowApi = false;
  static final ConnectivityService _singleton = ConnectivityService._internal();

  factory ConnectivityService() {
    return _singleton;
  }

  ConnectivityService._internal();

  bool isConnected = false;

  //stream allow to subscribe to connection changes
  // ignore: close_sinks
  StreamController<bool> connectivityStreamController = StreamController.broadcast();

  Stream<bool> get connectionChange => connectivityStreamController.stream;

  Future<void> init() async {
    Connectivity().onConnectivityChanged.listen(_checkConnection);
    // await checkApiLevel;
  }

  // Future<String> getDeviceID() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //
  //   if (Platform.isAndroid) {
  //     // ${androidInfo.device}
  //     return (await deviceInfo.androidInfo).androidId;
  //   } else if (Platform.isIOS) {
  //     return (await deviceInfo.iosInfo).identifierForVendor;
  //   }
  //   return null;
  // }
  //
  // Future<void> get checkApiLevel async {
  //   //check API LEVEL
  //   if (Platform.isAndroid) {
  //     final androidInfo = await DeviceInfoPlugin().androidInfo;
  //     final apiLEVEL = androidInfo.version.sdkInt;
  //     if (apiLEVEL < 20) lowApi = true;
  //   }
  // }

  //process ConnectivityResult status and notify screens
  _checkConnection(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isConnected = false;
      connectivityStreamController.sink.add(isConnected);
    } else if (!isConnected) {
      isConnected = await _connectionValid;
      connectivityStreamController.sink.add(isConnected);
    }

    //OLD approach used when need to preserve already loaded data while online
    // else if (state == false) {
    //   state = await _connectionValid;
    //   notifyListeners();
    // }
  }

  //The test to actually see if there is a connection
  Future<bool> get _connectionValid async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
