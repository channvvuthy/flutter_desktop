// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_element, must_be_immutable, unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_desktop/helper/local_storage.dart';
import 'package:flutter_desktop/models/response/login_response.dart';
import 'package:flutter_desktop/screen/auth/login_screen.dart';
import 'package:flutter_desktop/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isSkill = false;
  bool isIncome = false;
  int startLoading = 0;

  loginOrHome() async {
    String token = await LocalStorage.getItem("xtoken") ?? "";
    AuthController authCtrl = Get.put(AuthController());

    if (token != "") {
      var login = await LocalStorage.getItem("user");
      var json = jsonDecode(login);

      if (json["province"] == null) {
        Province province = Province(id: "", name: "");
        json["province"] = province.toJson();
      }

      if (json["school"] == null) {
        Province school = Province(id: "", name: "");
        json["school"] = school.toJson();
      }

      if (json["date_of_birth"] == null) {
        json["date_of_birth"] = DateTime.now().toString();
      }

      if (json["in_cart"] == null) {
        json["in_cart"] = 0;
      }

      LoginResponse auth = LoginResponse.fromJson(json);

      authCtrl.setToken(token);
      authCtrl.setLoginStatus(true);
      authCtrl.setAuthenticationUser(auth);

      Get.to(() => HomeScreen());
    } else {
      Get.to(() => LoginScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        startLoading++;
      });

      if (startLoading >= 1) {
        setState(() {
          isSkill = true;
        });
      }

      if (startLoading >= 2) {
        setState(() {
          isIncome = true;
        });
      }

      if (startLoading >= 3) {
        loginOrHome();
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            image: AssetImage(logoUrl))),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          child: Row(
                        children: [
                          _loadingText(text: "ចំណេះ", color: PRIMARY_COLOR),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )),
                      Visibility(
                          visible: isSkill,
                          child: Row(
                            children: [
                              _loadingText(
                                  text: "ជំនាញ", color: DARK_RED_COLOR),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          )),
                      Visibility(
                        visible: isIncome,
                        child:
                            _loadingText(text: "ចំណូល", color: PRIMARY_COLOR),
                      )
                    ],
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
    );
  }
}

class _loadingText extends StatelessWidget {
  String text;
  Color color;
  _loadingText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 22,
          fontFamily: "Kantumruy",
          fontWeight: FontWeight.w400),
    );
  }
}
