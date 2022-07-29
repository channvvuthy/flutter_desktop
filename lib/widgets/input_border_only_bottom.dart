// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_svg/svg.dart';

class InputBorderOnlyBottom extends StatelessWidget {
  final String placeholder;
  final String svgUrl;
  final TextEditingController controller;
  bool? isSecure;
  InputBorderOnlyBottom(
      {Key? key,
      required this.placeholder,
      this.isSecure,
      required this.svgUrl,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: BLACK_COLOR))),
      child: Row(children: [
        SvgPicture.asset(
          svgUrl,
          color: ICON_COLOR,
          width: 22,
          height: 22,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextField(
          obscureText: isSecure ?? false,
          controller: controller,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: ICON_COLOR),
              border: InputBorder.none,
              hintText: placeholder),
        ))
      ]),
    );
  }
}
