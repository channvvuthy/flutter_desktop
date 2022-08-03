// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/controllers/setting_controller.dart';
import 'package:flutter_desktop/controllers/story_controller.dart';
import 'package:flutter_desktop/screen/partials/header/header.dart';
import 'package:flutter_desktop/screen/partials/story/home_story.dart';
import 'package:flutter_desktop/widgets/greeting.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  SettingController settingCtr =
      Get.put<SettingController>(SettingController());
  StoryController storyCtr = Get.put(StoryController());

  @override
  void initState() {
    super.initState();
    storyCtr.getStory();
  }

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
                  height: 110,
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
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Greeting(),
                  ),
                  HomeStory(),
                ],
              ),
            )
          ],
        ));
  }
}
