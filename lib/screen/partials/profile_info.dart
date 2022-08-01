// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(color: ICON_COLOR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: WHITE_COLOR,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/img/eschool-cambodia.png"))),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Chann Vuthy")
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: WHITE_COLOR,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/eschool-cambodia.png"))),
          ),
        ],
      ),
    );
  }
}
