// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class AvatarLoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  const AvatarLoadingWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: ICON_COLOR, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
