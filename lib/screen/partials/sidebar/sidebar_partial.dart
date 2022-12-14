// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/controllers/setting_controller.dart';
import 'package:flutter_desktop/screen/partials/profile_info.dart';
import 'package:flutter_desktop/screen/partials/sidebar/menu_sidebar.dart';
import 'package:flutter_desktop/widgets/menu_hidden.dart';
import 'package:flutter_desktop/widgets/menu_opend.dart';
import 'package:get/get.dart';

class SidebarPartial extends StatelessWidget {
  SidebarPartial({Key? key}) : super(key: key);
  SettingController settingCtr = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Obx(() => Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: WHITE_COLOR,
                ),
                width: settingCtr.isMenuOpen.value ? 350 : 0,
                child: Column(children: [
                  ProfileInfo(),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [MenuSidebar()],
                  ))
                ]),
              ),
              Align(
                alignment: Alignment(0, -0.95),
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      color: PRIMARY_COLOR),
                  child: settingCtr.isMenuOpen.value
                      ? MenuOpend(onTap: () {
                          settingCtr.switchMenu();
                        })
                      : MenuHidden(onTap: () {
                          settingCtr.switchMenu();
                        }),
                ),
              ),
              Expanded(flex: 1, child: SizedBox())
            ],
          )),
    );
  }
}
