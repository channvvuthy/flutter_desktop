// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class ButtonBg extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const ButtonBg({Key? key, required this.txt, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: PRIMARY_COLOR),
        child: Text(
          txt,
          style: TextStyle(color: WHITE_COLOR),
        ),
      ),
    );
  }
}
