// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IconMenuHeader extends StatelessWidget {
  final bool isActive;
  final String title;
  final VoidCallback onTap;
  final String icnUrl;
  const IconMenuHeader(
      {Key? key,
      required this.isActive,
      required this.title,
      required this.onTap,
      required this.icnUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: isActive ? PRIMARY_COLOR : Colors.transparent))),
        child: Column(children: [
          SvgPicture.asset(
            icnUrl,
            width: 24,
            height: 24,
          ),
          SizedBox(
            height: 5,
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: Get.locale?.languageCode == "en"
                      ? "Ubuntu"
                      : "Kantumruy")),
          SizedBox(
            height: 4,
          ),
        ]),
      ),
    );
  }
}
