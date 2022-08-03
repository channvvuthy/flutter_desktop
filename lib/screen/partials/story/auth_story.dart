// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/models/response/login_response.dart';
import 'package:get/get.dart';

class AuthStory extends StatefulWidget {
  const AuthStory({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthStory> createState() => _AuthStoryState();
}

class _AuthStoryState extends State<AuthStory> {
  AuthController authCtrl = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.only(left: 10, top: 10),
          width: 120,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(authCtrl.auth.photo)),
              borderRadius: BorderRadius.circular(12.0),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black26,
                  Colors.black26,
                ],
              )),
          child: Stack(clipBehavior: Clip.none, children: [
            Positioned(
              bottom: -5,
              right: -5,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(20)),
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.add,
                    color: WHITE_COLOR,
                  ),
                ),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
