// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_svg/svg.dart';

class IconMenu extends StatelessWidget {
  final String title;
  final String icnUrl;
  IconMenu({Key? key, required this.title, required this.icnUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          style: TextStyle(fontSize: 11),
          softWrap: false,
        ),
      ]),
    );
  }
}
