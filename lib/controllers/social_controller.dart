import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class SocialController extends GetxController {
  final DioService dioService = DioService();

  SocialController() {
    dioService.init();
  }

  RxBool isLoading = false.obs;
  RxList social = [].obs;

  getSocial() async {
    isLoading.value = true;

    try {
      var response = await dioService.get("social");

      isLoading.value = false;
      switch (response.data["status"]) {
        case 0:
          social.value = response.data["data"];
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
