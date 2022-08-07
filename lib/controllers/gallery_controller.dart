import 'package:flutter_desktop/controllers/story_controller.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/services/dio_service.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  final DioService dioService = DioService();
  StoryController storyCtrl = Get.put(StoryController());

  GalleryController() {
    dioService.init();
    isLoading.value = false;
  }

  RxBool isLoading = false.obs;
  RxBool isPaging = false.obs;
  RxList galleries = [].obs;
  RxInt p = 1.obs;

  getStory() async {
    isLoading.value = true;
    try {
      var response = await dioService.get("story");
      isLoading.value = false;
      switch (response.data["status"]) {
        case 0:
          galleries.value = response.data["data"];
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

  getPagingStory() async {
    isPaging.value = true;
    try {
      var response = await dioService.get("story?p=$p");
      isPaging.value = false;
      switch (response.data["status"]) {
        case 0:
          var list = response.data["data"];
          list.forEach((element) {
            galleries.add(element);
            storyCtrl.stories.add(element);
          });
          break;
        default:
          validateDialog(response.data["msg"].toString().tr);
          break;
      }
    } catch (e) {
      validateDialog(e.toString());
      isPaging.value = false;
    }
  }
}
