// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/setting_controller.dart';
import 'package:flutter_desktop/screen/partials/header/back_header.dart';
import 'package:flutter_desktop/screen/partials/sidebar/sidebar_partial.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackHeader(
          title: "back",
        ),
        SidebarPartial(),
      ]),
    );
  }
}
