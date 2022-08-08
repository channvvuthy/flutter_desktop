import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final DioService dioService = DioService();

  UserController() {
    dioService.init();
  }

  RxBool isLoading = false.obs;
  static RxString id = "".obs;
  RxMap userDetail = {}.obs;

  getUserDetail(String id) async {
    isLoading.value = true;

    try {
      var response = await dioService.get("user/detail?id=$id");
      isLoading.value = false;
      print(response);
      switch (response.data["status"]) {
        case 0:
          userDetail.value = response.data["data"];
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
