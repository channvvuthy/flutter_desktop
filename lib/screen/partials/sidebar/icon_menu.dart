// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IconMenu extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String icnUrl;
  IconMenu(
      {Key? key,
      required this.title,
      required this.icnUrl,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: BORDER_COLOR, width: 1)),
            child: SvgPicture.asset(
              icnUrl,
              color: BORDER_COLOR,
              width: 24,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 11,
                fontFamily:
                    Get.locale?.languageCode == "en" ? "Ubuntu" : "Kantumruy"),
            softWrap: false,
          ),
        ]),
      ),
    );
  }
}
