// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/screen/partials/sidebar/icon_menu.dart';
import 'package:get/get.dart';

class MenuSidebar extends StatelessWidget {
  const MenuSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "study_and_sharing".tr,
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 180,
          child: GridView.count(
            primary: false,
            crossAxisCount: 4,
            children: <Widget>[
              IconMenu(
                title: "my_course".tr,
                icnUrl: myCourseUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "my_zoom".tr,
                icnUrl: zoomUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "my_library".tr,
                icnUrl: libraryUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "favorite".tr,
                icnUrl: favoriteUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "friend".tr,
                icnUrl: friendUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "document".tr,
                icnUrl: documentUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "gallery".tr,
                icnUrl: galleryUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "certificate".tr,
                icnUrl: certificateUrl,
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "report".tr,
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 90,
          child: GridView.count(
            primary: false,
            crossAxisCount: 4,
            children: <Widget>[
              IconMenu(
                title: "summary".tr,
                icnUrl: activityUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "watch_video".tr,
                icnUrl: myCourseUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "read_book".tr,
                icnUrl: bookUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "relative".tr,
                icnUrl: relativeUrl,
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "me_and_privacy".tr,
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 180,
          child: GridView.count(
            primary: false,
            crossAxisCount: 4,
            children: <Widget>[
              IconMenu(
                title: "profile".tr,
                icnUrl: myCourseUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "change_password".tr,
                icnUrl: zoomUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "parent".tr,
                icnUrl: libraryUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "insurance".tr,
                icnUrl: favoriteUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "invoice".tr,
                icnUrl: friendUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "other".tr,
                icnUrl: documentUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "logout".tr,
                icnUrl: galleryUrl,
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "e_school".tr,
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 180,
          child: GridView.count(
            primary: false,
            crossAxisCount: 4,
            children: <Widget>[
              IconMenu(
                title: "hot_chat".tr,
                icnUrl: myCourseUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "policy".tr,
                icnUrl: zoomUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "help".tr,
                icnUrl: libraryUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "about".tr,
                icnUrl: favoriteUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "share_app".tr,
                icnUrl: friendUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "dark_mode".tr,
                icnUrl: documentUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "language".tr,
                icnUrl: galleryUrl,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
