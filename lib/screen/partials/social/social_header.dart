// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_desktop/helper/url_helper.dart';
import 'package:flutter_desktop/screen/partials/widgets/avatar_widget.dart';
import 'package:flutter_desktop/screen/partials/widgets/round_button_with_icon.dart';
import 'package:get/get.dart';

class SocialHeader extends StatefulWidget {
  const SocialHeader({Key? key}) : super(key: key);

  @override
  State<SocialHeader> createState() => _SocialHeaderState();
}

class _SocialHeaderState extends State<SocialHeader> {
  AuthController authCtrl = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: SOCIAL_BORDER, width: 1),
              bottom: BorderSide(color: SOCIAL_BORDER, width: 1))),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Row(children: [
                Expanded(
                    flex: 0,
                    child: Container(
                      child: AvatarWidget(
                        assetUrl: UrlHelper.url(authCtrl.auth.photo),
                        height: 70,
                        onTap: () {},
                        width: 70,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "say_something".tr,
                        style: TextStyle(color: ICON_COLOR),
                      ),
                    ))
              ]),
            )),
        Expanded(
            flex: 0,
            child: Row(
              children: [
                SizedBox(
                  child: RoundButtonWithIcon(
                    height: 45,
                    width: 45,
                    iconUrl: postVideoUrl,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  child: RoundButtonWithIcon(
                    height: 45,
                    width: 45,
                    iconUrl: photoUrl,
                    onTap: () {},
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
