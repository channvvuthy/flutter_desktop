// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:get/get.dart';

class MenuTitle extends StatelessWidget {
  final String title;
  const MenuTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title.tr,
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
