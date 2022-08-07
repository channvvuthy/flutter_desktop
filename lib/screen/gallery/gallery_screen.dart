// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/controllers/setting_controller.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/screen/gallery/gallery_screen_list.dart';
import 'package:flutter_desktop/screen/home/home_screen.dart';
import 'package:flutter_desktop/screen/partials/sidebar/sidebar_partial.dart';
import 'package:flutter_desktop/screen/partials/widgets/box_shadow.dart';
import 'package:get/get.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  SettingController settingCtr = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(children: [
                  Visibility(
                      visible: settingCtr.isMenuOpen.isTrue,
                      child: const SizedBox(
                        width: 350,
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    height: 90,
                    width: settingCtr.isMenuOpen.isTrue
                        ? screenWidth - 350
                        : screenWidth,
                    decoration: BoxDecoration(
                        color: WHITE_COLOR,
                        border: Border(
                            bottom: BorderSide(color: ICON_COLOR, width: 1))),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => HomeScreen());
                            },
                            child: Container(
                              width: 30,
                              height: 25,
                              decoration: BoxDecoration(
                                  boxShadow: [boxShadow(0, 1), boxShadow(1, 0)],
                                  borderRadius: BorderRadius.circular(4),
                                  color: WHITE_COLOR),
                              child: Icon(
                                Icons.navigate_before,
                                size: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    Get.locale?.languageCode == "en" ? 4 : 0),
                            child: Text(
                              "all_story".tr,
                              style: TextStyle(fontFamily: fontFamiliy()),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ])),
            Expanded(child: GalleryScreenList()),
          ],
        ),
        SidebarPartial(),
      ]),
    );
  }
}
