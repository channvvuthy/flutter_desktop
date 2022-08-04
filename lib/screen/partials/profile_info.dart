// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:clipboard/clipboard.dart';

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
                                      : AssetImage(eschoolUrl)
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
                            titlePadding: EdgeInsets.only(top: 20),
                            titleStyle: TextStyle(color: PRIMARY_COLOR),
                            title: "my_qr".tr,
                            content: Column(
                              children: [
                                Text("Scan here to add friend"),
                                SizedBox(
                                  width: 300,
                                  child: Image.network(
                                      authCtrl.qrCodeResponse.qrcodeUrl),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        FlutterClipboard.copy(authCtrl
                                                .qrCodeResponse.profileUrl)
                                            .then((value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text("Copied")));
                                          Get.back();
                                        });
                                      },
                                      child: Container(
                                          width: 260,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: PRIMARY_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                copyUrl,
                                                color: WHITE_COLOR,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Copy",
                                                style: TextStyle(
                                                    color: WHITE_COLOR),
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                )
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
