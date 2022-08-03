// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  AuthController authCtrl = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    print(authCtrl.auth);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          greetingUrl,
          color: PRIMARY_COLOR,
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "2003".tr,
          style: TextStyle(
              fontFamily: fontFamiliy(), fontSize: 18, color: PRIMARY_COLOR),
        ),
        SizedBox(
          width: 10,
        ),
        Text("${authCtrl.auth.lastName} ${authCtrl.auth.firstName}",
            style: TextStyle(
                fontFamily: fontFamiliy(), fontSize: 18, color: PRIMARY_COLOR))
      ],
    );
  }
}
