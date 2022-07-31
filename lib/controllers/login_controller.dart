// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter_desktop/helper/device_info.dart';
import 'package:flutter_desktop/helper/local_storage.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/models/request/login_request.dart';
import 'package:flutter_desktop/screen/home/home_screen.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final DioService dioService = DioService();

  LoginController() {
    dioService.init();
  }

  RxBool isLoading = false.obs;

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

    isLoading.value = true;

    try {
      Map body = loginRequest.toJson();
      var response = await dioService.post("user/login", body);
      isLoading.value = false;

      switch (response.data["status"]) {
        case 1:
          validateDialog(response.data["msg"].toString().tr);
          break;
        case 0:
          dioService.setToken(response.data["data"]["token"]);
          LocalStorage.setItem("xtoken", response.data["data"]["token"]);
          LocalStorage.setItem("user", jsonEncode(response.data["data"]));
          Get.to(() => const HomeScreen());
          break;
      }
    } catch (e) {
      validateDialog(e.toString());
      isLoading.value = false;
    }
  }
}
