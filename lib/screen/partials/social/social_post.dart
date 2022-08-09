// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/social_controller.dart';
import 'package:flutter_desktop/screen/partials/widgets/avatar_widget.dart';
import 'package:flutter_desktop/screen/partials/widgets/doted_widget.dart';
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
    socialCtrl.getSocial();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: SOCIAL_BORDER)),
      child: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (socialCtrl.isLoading.isTrue) ...[Text("Loading...")],
                Row(
                  children: [
                    AvatarWidget(
                      width: 70,
                      height: 70,
                      assetUrl: eschoolUrl,
                      onTap: () {},
                      isNetwork: false,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hang Theary",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1 hour ago",
                          style: TextStyle(color: ICON_COLOR, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    DotedWidget(width: 4, height: 4, color: BLACK_COLOR),
                    SizedBox(
                      height: 3,
                    ),
                    DotedWidget(width: 4, height: 4, color: BLACK_COLOR),
                    SizedBox(
                      height: 3,
                    ),
                    DotedWidget(width: 4, height: 4, color: BLACK_COLOR)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.")
        ],
      ),
    );
  }
}
