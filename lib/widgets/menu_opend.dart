// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class MenuOpend extends StatelessWidget {
  const MenuOpend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: WHITE_COLOR, borderRadius: BorderRadius.circular(15)),
          child: Icon(
            Icons.navigate_before,
            size: 16,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
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
        )
      ],
    );
  }
}
