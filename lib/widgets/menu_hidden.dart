// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class MenuHidden extends StatelessWidget {
  final VoidCallback onTap;
  const MenuHidden({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 2,
                decoration: BoxDecoration(color: WHITE_COLOR),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 23,
                height: 2,
                decoration: BoxDecoration(color: WHITE_COLOR),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 20,
                height: 2,
                decoration: BoxDecoration(color: WHITE_COLOR),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: WHITE_COLOR, borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.navigate_next,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
