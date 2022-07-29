// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_element, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/helper/validate.dart';
import 'package:flutter_desktop/widgets/button_bg.dart';
import 'package:flutter_desktop/widgets/input_border_only_bottom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
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
                                  placeholder: "Phone number",
                                  svgUrl: phoneUrl,
                                  controller: phone),
                              SizedBox(
                                height: 30,
                              ),
                              InputBorderOnlyBottom(
                                  isSecure: true,
                                  placeholder: "Password",
                                  svgUrl: lockUrl,
                                  controller: password),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: FORGET_PASS),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ButtonBg(
                                    txt: "Login",
                                    onTap: () {
                                      validate(
                                        {
                                          'phone': {
                                            'value': phone.text,
                                            'validate': {
                                              'required': true,
                                              "min": 6
                                            }
                                          },
                                          'password': {
                                            'value': password.text,
                                            'validate': {
                                              'required': true,
                                              "min": 6
                                            }
                                          },
                                        },
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Don’t have an account?"),
                                    Text(
                                      "  Sign Up",
                                      style: TextStyle(color: PRIMARY_COLOR),
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
    );
  }
}
