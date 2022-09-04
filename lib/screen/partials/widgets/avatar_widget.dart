// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class AvatarWidget extends StatelessWidget {
  final double width;
  final double height;
  final String assetUrl;
  final VoidCallback onTap;
  bool? isNetwork = true;
  AvatarWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.assetUrl,
      this.isNetwork = true,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
            color: ICON_COLOR,
            image: DecorationImage(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                image: isNetwork == false
                    ? AssetImage(assetUrl)
                    : NetworkImage(assetUrl) as ImageProvider),
            borderRadius: BorderRadius.circular(width)),
      ),
    );
  }
}
