// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/setting_controller.dart';
import 'package:flutter_desktop/controllers/user_controller.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/helper/null_helper.dart';
import 'package:flutter_desktop/helper/url_helper.dart';
import 'package:flutter_desktop/screen/auth/user_info.dart';
import 'package:flutter_desktop/screen/partials/header/back_header.dart';
import 'package:flutter_desktop/screen/partials/sidebar/sidebar_partial.dart';
import 'package:flutter_desktop/screen/partials/widgets/box_shadow.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SettingController settingCtr = Get.put(SettingController());
  UserController userCtrl = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  void getUserDetail() async {
    await userCtrl.getUserDetail(UserController.id.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            BackHeader(
              title: "back",
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            boxShadow: [boxShadow(1, 0), boxShadow(0, 1)],
                            borderRadius: BorderRadius.circular(12.0)),
                        width: 400,
                        height: 300,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(coverUrl))),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(color: WHITE_COLOR),
                                )),
                              ],
                            ),
                            Obx(() => Positioned(
                                  top: 100,
                                  left: 180,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.high,
                                                image: userCtrl.isLoading.isTrue
                                                    ? AssetImage(eschoolUrl)
                                                    : NetworkImage(UrlHelper
                                                            .url(userCtrl
                                                                    .userDetail[
                                                                "photo"]))
                                                        as ImageProvider),
                                            color: ICON_COLOR,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        userCtrl.isLoading.isTrue
                                            ? ""
                                            : userCtrl.userDetail["last_name"] +
                                                " " +
                                                userCtrl
                                                    .userDetail["first_name"],
                                        style: TextStyle(
                                          fontFamily: fontFamiliy(),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        )),
                  ),
                  Obx(() => Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.none,
                              height: 300,
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      UserInfo(title: "social", icon: shareUrl),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      UserInfo(
                                        title: "document",
                                        icon: documentUrl,
                                        des: NullHelper.nullString(
                                            userCtrl.userDetail["des"]),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      UserInfo(
                                        title: "province",
                                        icon: markerUrl,
                                        des: NullHelper.nullString(userCtrl
                                            .userDetail["province_name"]),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      UserInfo(
                                        title: "school",
                                        icon: universityrUrl,
                                        des: NullHelper.nullString(
                                            userCtrl.userDetail["school_name"]),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      UserInfo(
                                          title: "gallery", icon: photoUrl),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      UserInfo(
                                          title: "friend", icon: friendUrl),
                                    ])
                              ]),
                            ),
                          ],
                        ),
                      )))
                ],
              ),
            )
          ],
        ),
        SidebarPartial(),
      ]),
    );
  }
}
