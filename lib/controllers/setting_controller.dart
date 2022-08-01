import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isMenuOpen = false.obs;

  void switchMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }
}
