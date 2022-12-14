import 'package:flutter_desktop/helper/local_storage.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/models/response/login_response.dart';
import 'package:flutter_desktop/models/response/qr_code_response.dart';
import 'package:flutter_desktop/screen/auth/login_screen.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  DioService dioService = DioService();
  RxBool isLoading = false.obs;

  AuthController() {
    dioService.init();
  }

  RxBool isLogin = false.obs;
  late LoginResponse auth;
  QrCodeResponse qrCodeResponse = QrCodeResponse(qrcodeUrl: "", profileUrl: "");

  setToken(String token) {
    dioService.setToken(token);
  }

  setLoginStatus(bool status) {
    isLogin.value = status;
  }

  setAuthenticationUser(LoginResponse user) {
    auth = user;
  }

  getQrCode() async {
    isLoading.value = true;
    try {
      var response = await dioService.get("me/qrcode");
      switch (response.data["status"]) {
        case 0:
          qrCodeResponse = QrCodeResponse.fromJson(response.data["data"]);
          break;
        default:
          validateDialog(response.data["msg"].toString().tr);
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      validateDialog(e.toString());
    }
  }

  logout() async {
    isLoading.value = true;
    try {
      var response = await dioService.get("me/logout");
      switch (response.data["status"]) {
        default:
          LocalStorage.removeItem("xtoken");
          LocalStorage.removeItem("user");
          setToken("");
          Get.to(() => const LoginScreen());
      }
    } catch (e) {
      validateDialog(e.toString());
    }
  }
}
