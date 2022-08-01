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
                title: "My Course",
                icnUrl: myCourseUrl,
              ),
              IconMenu(
                title: "My Zoom",
                icnUrl: zoomUrl,
              ),
              IconMenu(
                title: "My Library",
                icnUrl: libraryUrl,
              ),
              IconMenu(
                title: "Favorite",
                icnUrl: favoriteUrl,
              ),
              IconMenu(
                title: "Friend",
                icnUrl: friendUrl,
              ),
              IconMenu(
                title: "Document",
                icnUrl: documentUrl,
              ),
              IconMenu(
                title: "Gallery",
                icnUrl: galleryUrl,
              ),
              IconMenu(
                title: "Certificate",
                icnUrl: certificateUrl,
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
                title: "My Course",
                icnUrl: myCourseUrl,
              ),
              IconMenu(
                title: "My Zoom",
                icnUrl: zoomUrl,
              ),
              IconMenu(
                title: "My Library",
                icnUrl: libraryUrl,
              ),
              IconMenu(
                title: "Favorite",
                icnUrl: favoriteUrl,
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
                title: "My Course",
                icnUrl: myCourseUrl,
              ),
              IconMenu(
                title: "My Zoom",
                icnUrl: zoomUrl,
              ),
              IconMenu(
                title: "My Library",
                icnUrl: libraryUrl,
              ),
              IconMenu(
                title: "Favorite",
                icnUrl: favoriteUrl,
              ),
              IconMenu(
                title: "Friend",
                icnUrl: friendUrl,
              ),
              IconMenu(
                title: "Document",
                icnUrl: documentUrl,
              ),
              IconMenu(
                title: "Gallery",
                icnUrl: galleryUrl,
              ),
              IconMenu(
                title: "Certificate",
                icnUrl: certificateUrl,
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
                title: "My Course",
                icnUrl: myCourseUrl,
              ),
              IconMenu(
                title: "My Zoom",
                icnUrl: zoomUrl,
              ),
              IconMenu(
                title: "My Library",
                icnUrl: libraryUrl,
              ),
              IconMenu(
                title: "Favorite",
                icnUrl: favoriteUrl,
              ),
              IconMenu(
                title: "Friend",
                icnUrl: friendUrl,
              ),
              IconMenu(
                title: "Document",
                icnUrl: documentUrl,
              ),
              IconMenu(
                title: "Gallery",
                icnUrl: galleryUrl,
              ),
              IconMenu(
                title: "Certificate",
                icnUrl: certificateUrl,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
