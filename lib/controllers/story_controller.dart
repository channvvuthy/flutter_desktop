// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  final DioService dioService = DioService();

  StoryController() {
    dioService.init();
  }

  RxBool isLoading = false.obs;
  RxInt p = 0.obs;

  List stories = [];

  getStory() async {
    isLoading.value = true;
    String queryString = "";
    if (p > 0) {
      queryString = "?p=$p";
    }

    try {
      var response = await dioService.get("story/$queryString");
      isLoading.value = false;
      switch (response.data["status"]) {
        case 0:
          if (p > 1) {
            var list = response.data["data"];
            list.forEach((element) {
              stories.add(element);
            });
          } else {
            stories = response.data["data"];
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