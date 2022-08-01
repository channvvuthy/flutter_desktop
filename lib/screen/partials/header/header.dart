// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/screen/partials/header/icon_menu_header.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconMenuHeader(
          isActive: true, title: "home".tr, onTap: () {}, icnUrl: homeThinUrl),
      SizedBox(
        width: 40,
      ),
      IconMenuHeader(
          isActive: false,
          title: "video".tr,
          onTap: () {},
          icnUrl: myCourseUrl),
      SizedBox(
        width: 40,
      ),
      IconMenuHeader(
          isActive: false,
          title: "library".tr,
          onTap: () {},
          icnUrl: libraryUrl),
      SizedBox(
        width: 40,
      ),
      IconMenuHeader(
          isActive: false,
          title: "parthner".tr,
          onTap: () {},
          icnUrl: parthnerThinUrl),
      SizedBox(
        width: 40,
      ),
      IconMenuHeader(
          isActive: false, title: "zoom".tr, onTap: () {}, icnUrl: zoomUrl)
    ]);
  }
}
