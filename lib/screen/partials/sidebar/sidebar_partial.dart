// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/widgets/menu_opend.dart';

class SidebarPartial extends StatelessWidget {
  const SidebarPartial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        children: [
          Container(
            width: 350,
            color: PRIMARY_COLOR,
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: Container(
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.center,
              width: 55,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: PRIMARY_COLOR),
              child: MenuOpend(),
            ),
          ),
          Expanded(flex: 1, child: SizedBox())
        ],
      ),
    );
  }
}
