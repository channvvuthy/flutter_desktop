// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_element, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/controllers/login_controller.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/screen/auth/register_screen.dart';
import 'package:flutter_desktop/widgets/button_bg.dart';
import 'package:flutter_desktop/widgets/input_border_only_bottom.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  HomeController homeController = HomeController();
  LoginController loginCtrl = Get.put(LoginController());

  @override
  void initState() {
    super.initState();

    homeController.getProvince();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    return Obx(() => Scaffold(
          body: Center(
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 450,
                        height: 500,
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
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      image: AssetImage(logoOutlineUrl))),
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InputBorderOnlyBottom(
                                      placeholder: "phone_number".tr,
                                      svgUrl: phoneUrl,
                                      controller: phone),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InputBorderOnlyBottom(
                                      isSecure: true,
                                      placeholder: "password".tr,
                                      svgUrl: lockUrl,
                                      controller: password),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "forget_password".tr,
                                      style: TextStyle(color: FORGET_PASS),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: ButtonBg(
                                        isLoading: loginCtrl.isLoading.value,
                                        txt: "login".tr,
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
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("no_account".tr),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => RegisterScreen());
                                          },
                                          child: Text(
                                            " ${"sign_up".tr}",
                                            style:
                                                TextStyle(color: PRIMARY_COLOR),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
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
            ]),
          ),
        ));
  }
}
