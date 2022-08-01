// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/controllers/setting_controller.dart';
import 'package:flutter_desktop/screen/partials/header/header.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  SettingController settingCtr =
      Get.put<SettingController>(SettingController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => Column(
          children: [
            Row(
              children: [
                Visibility(
                    visible: settingCtr.isMenuOpen.isTrue,
                    child: const SizedBox(
                      width: 350,
                    )),
                Container(
                  padding: EdgeInsets.only(left: 80),
                  height: 120,
                  width: settingCtr.isMenuOpen.isTrue
                      ? screenWidth - 350
                      : screenWidth,
                  decoration: BoxDecoration(
                      color: WHITE_COLOR,
                      border: Border(
                          bottom: BorderSide(color: ICON_COLOR, width: 1))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Header()]),
                )
              ],
            )
          ],
        ));
  }
}
