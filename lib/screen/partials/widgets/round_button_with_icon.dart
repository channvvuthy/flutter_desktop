// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundButtonWithIcon extends StatelessWidget {
  final double width;
  final double height;
  final String iconUrl;
  final VoidCallback onTap;
  const RoundButtonWithIcon(
      {Key? key,
      required this.width,
      required this.height,
      required this.iconUrl,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: SOCIAL_BORDER, borderRadius: BorderRadius.circular(height)),
        child: SvgPicture.asset(
          iconUrl,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
