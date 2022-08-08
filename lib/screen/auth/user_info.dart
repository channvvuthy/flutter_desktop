// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/screen/partials/widgets/box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  final String title;
  final String icon;
  String gender = "";
  UserInfo(
      {Key? key, required this.title, required this.icon, this.gender = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 140,
      decoration: BoxDecoration(
          boxShadow: [boxShadow(0, 1)],
          borderRadius: BorderRadius.circular(12.0),
          color: WHITE_COLOR),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          title.tr,
          style: TextStyle(fontFamily: fontFamiliy(), fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        SvgPicture.asset(
          icon,
          color: PRIMARY_COLOR,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Text(gender, style: TextStyle(fontFamily: fontFamiliy(), fontSize: 18))
      ]),
    ));
  }
}
