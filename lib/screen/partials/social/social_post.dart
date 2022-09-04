// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/social_controller.dart';
import 'package:flutter_desktop/models/response/social_response.dart';
import 'package:flutter_desktop/screen/partials/social/loading_social.dart';
import 'package:flutter_desktop/screen/partials/social/social_content.dart';
import 'package:get/get.dart';

class SocialPost extends StatefulWidget {
  const SocialPost({Key? key}) : super(key: key);

  @override
  State<SocialPost> createState() => _SocialPostState();
}

class _SocialPostState extends State<SocialPost> {
  SocialController socialCtrl = Get.put(SocialController());

  @override
  void initState() {
    super.initState();
    getSocial();
  }

  getSocial() async {
    await socialCtrl.getSocial();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => socialCtrl.isLoading.isTrue
        ? Column(
            children: [LoadingSocial()],
          )
        : Column(
            children: socialCtrl.social
                .map((element) => SocialContent(
                      socialResponse: SocialResponse.fromJson(element),
                    ))
                .toList(),
          ));
  }
}
