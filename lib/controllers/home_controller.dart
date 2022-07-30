// ignore_for_file: avoid_print

import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/services/dio_service.dart';

class HomeController {
  final DioService dioService = DioService();
  HomeController() {
    dioService.init();
  }
  getProvince() async {
    try {
      var x = await dioService.get("province");
      print(x);
    } catch (e) {
      validateDialog(e.toString());
    }
  }
}
