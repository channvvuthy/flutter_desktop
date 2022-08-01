// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuHeader extends StatelessWidget {
  final bool isActive;
  final String title;
  final VoidCallback onTap;
  final String icnUrl;
  const MenuHeader(
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
        child: Column(children: [
          SvgPicture.asset(icnUrl),
          SizedBox(
            height: 10,
          ),
          Text(title),
        ]),
      ),
    );
  }
}
