// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter_desktop/helper/device_info.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/models/request/login_request.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final DioService dioService = DioService();
  LoginController() {
    dioService.init();
  }
  login(String phone, String password) async {
    var deviceInfo = await initPlatformState();
    LoginRequest loginRequest = LoginRequest(
      phone: phone,
      password: password,
      appVersion: '5.2',
      deviceId: deviceInfo['systemGUID'],
      deviceOs: deviceInfo['hostName'],
      deviceName: deviceInfo['computerName'],
      playerId: '',
      acceptedPostPolicy: 0,
    );
    try {
      var response = await dioService.post("user/login", loginRequest.toJson());
      if (response.data["status"] == 1) {
        validateDialog(response.data["msg"].toString().tr);
      }
    } catch (e) {
      validateDialog(e.toString());
    }
  }
}
