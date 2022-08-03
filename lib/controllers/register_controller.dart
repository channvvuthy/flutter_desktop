// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter_desktop/helper/device_info.dart';
import 'package:flutter_desktop/helper/local_storage.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/models/request/register_request.dart';
import 'package:flutter_desktop/screen/loading/loading_screen.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final DioService dioService = DioService();

  RegisterController() {
    dioService.init();
  }

  RxBool isLoading = false.obs;

  register(String phone, String password, String confirmPassword,
      String firstName, String lastName, String gender) async {
    var deviceInfo = await initPlatformState();
    RegisterRequest loginRequest = RegisterRequest(
      phone: phone,
      password: password,
      appVersion: '5.2',
      deviceId: deviceInfo['systemGUID'],
      deviceOs: deviceInfo['hostName'],
      deviceName: deviceInfo['computerName'],
      playerId: '',
      acceptedPostPolicy: 0,
      confirmPassword: confirmPassword,
      firstName: firstName,
      gender: gender,
      lastName: lastName,
    );

    isLoading.value = true;

    try {
      Map body = loginRequest.toJson();
      var response = await dioService.post("user/register", body);
      isLoading.value = false;

      switch (response.data["status"]) {
        case 0:
          dioService.setToken(response.data["data"]["token"]);
          LocalStorage.setItem("xtoken", response.data["data"]["token"]);
          LocalStorage.setItem("user", jsonEncode(response.data["data"]));
          Get.to(() => const LoadingScreen());
          break;
        default:
          validateDialog(response.data["msg"].toString().tr);
          break;
      }
    } catch (e) {
      validateDialog(e.toString());
      isLoading.value = false;
    }
  }
}
