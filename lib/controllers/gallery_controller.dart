import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  final DioService dioService = DioService();

  GalleryController() {
    dioService.init();
    isLoading.value = false;
  }

  RxBool isLoading = false.obs;
  RxList galleries = [].obs;
  RxInt p = 1.obs;

  getStory() async {
    isLoading.value = true;
    String queryString = "";
    if (p > 1) {
      queryString = "?p=$p";
    }

    try {
      var response = await dioService.get("story/$queryString");
      isLoading.value = false;
      switch (response.data["status"]) {
        case 0:
          if (p.value > 1) {
            var list = response.data["data"];
            list.forEach((element) {
              galleries.add(element);
            });
          } else {
            galleries.value = response.data["data"];
          }
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
