// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/controllers/login_controller.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/widgets/button_bg.dart';
import 'package:flutter_desktop/widgets/input_border_only_bottom.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  HomeController homeController = HomeController();
  LoginController loginCtrl = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    return Obx(() => Scaffold(
          body: Center(
              child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 450,
                        height: 630,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.navigate_before,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "sign_up".tr,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: fontFamiliy.toString()),
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InputBorderOnlyBottom(
                                      placeholder: "last_name".tr,
                                      svgUrl: userUrl,
                                      controller: phone),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InputBorderOnlyBottom(
                                      isSecure: true,
                                      placeholder: "first_name".tr,
                                      svgUrl: userUrl,
                                      controller: password),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(children: [
                                    SizedBox(
                                      width: 150,
                                      child: ListTile(
                                          leading: Radio(
                                            groupValue: 1,
                                            value: 0,
                                            onChanged: (value) {},
                                          ),
                                          title: Text("male".tr)),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: ListTile(
                                          leading: Radio(
                                            groupValue: 1,
                                            value: 1,
                                            onChanged: (value) {},
                                          ),
                                          title: Text("female".tr)),
                                    )
                                  ]),
                                  InputBorderOnlyBottom(
                                      placeholder: "phone_number".tr,
                                      svgUrl: phoneUrl,
                                      controller: password),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InputBorderOnlyBottom(
                                      isSecure: true,
                                      placeholder: "password".tr,
                                      svgUrl: lockUrl,
                                      controller: password),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InputBorderOnlyBottom(
                                      isSecure: true,
                                      placeholder: "confirm_password".tr,
                                      svgUrl: lockUrl,
                                      controller: password),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: Radio(
                                      groupValue: 2,
                                      value: 0,
                                      onChanged: (value) {},
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          "accept".tr,
                                          style: TextStyle(
                                              fontFamily: fontFamiliy()),
                                        ),
                                        Text(" "),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "privacy".tr,
                                            style: TextStyle(
                                                color: PRIMARY_COLOR,
                                                fontFamily: fontFamiliy()),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: ButtonBg(
                                        isLoading: loginCtrl.isLoading.value,
                                        txt: "sign_up".tr,
                                        onTap: () {
                                          if (validate(
                                            {
                                              'phone': {
                                                'value': phone.text,
                                                'validate': {
                                                  'required': true,
                                                  "min": 6,
                                                  "phone": true,
                                                }
                                              },
                                              'password': {
                                                'value': password.text,
                                                'validate': {
                                                  'required': true,
                                                  "min": 6,
                                                }
                                              },
                                            },
                                          )) {
                                            loginCtrl.login(
                                                phone.text, password.text);
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(footerUrl))),
                    height: 80,
                    width: double.infinity,
                  ))
            ],
          )),
        ));
  }
}
