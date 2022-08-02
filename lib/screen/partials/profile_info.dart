// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  AuthController authCtrl = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    authCtrl.getQrCode();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          height: 175,
          width: double.infinity,
          decoration: BoxDecoration(color: PRIMARY_COLOR),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: WHITE_COLOR,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: authCtrl.isLogin.value == true
                                      ? NetworkImage(authCtrl.auth.photo)
                                      : AssetImage(
                                              "assets/img/eschool-cambodia.png")
                                          as ImageProvider)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            child: authCtrl.isLogin.value == true
                                ? Text(
                                    "${authCtrl.auth.firstName} ${authCtrl.auth.lastName}",
                                    style: TextStyle(color: WHITE_COLOR),
                                  )
                                : Text(
                                    "unknown".tr,
                                    style: TextStyle(color: WHITE_COLOR),
                                  ))
                      ],
                    ),
                  ),
                  Visibility(
                    visible: authCtrl.isLogin.value,
                    child: InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            title: "my_qr".tr,
                            content: Column(
                              children: [
                                Text(authCtrl.qrCodeResponse.profileUrl)
                              ],
                            ));
                      },
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: WHITE_COLOR),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: SvgPicture.asset(
                            qrUrl,
                            color: WHITE_COLOR,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "my_qr".tr,
                          style: TextStyle(color: WHITE_COLOR),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
