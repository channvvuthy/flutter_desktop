// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_desktop/screen/partials/sidebar/icon_menu.dart';
import 'package:flutter_desktop/screen/partials/sidebar/menu_title.dart';
import 'package:get/get.dart';

class MenuSidebar extends StatelessWidget {
  MenuSidebar({Key? key}) : super(key: key);
  AuthController authCtrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuTitle(title: "study_and_sharing"),
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
        MenuTitle(title: "report"),
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
        MenuTitle(title: "me_and_privacy"),
        SizedBox(
          height: 180,
          child: GridView.count(
            primary: false,
            crossAxisCount: 4,
            children: <Widget>[
              IconMenu(
                title: "profile".tr,
                icnUrl: profileUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "change_password".tr,
                icnUrl: changePasswordUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "parent".tr,
                icnUrl: parentUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "insurance".tr,
                icnUrl: insuranceUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "invoice".tr,
                icnUrl: invoiceUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "other".tr,
                icnUrl: otherUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "logout".tr,
                icnUrl: logoutUrl,
                onTap: () async {
                  await authCtrl.logout();
                },
              ),
            ],
          ),
        ),
        MenuTitle(title: "e_school"),
        SizedBox(
          height: 180,
          child: GridView.count(
            primary: false,
            crossAxisCount: 4,
            children: <Widget>[
              IconMenu(
                title: "hot_chat".tr,
                icnUrl: chatUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "policy".tr,
                icnUrl: policyUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "help".tr,
                icnUrl: helpUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "about".tr,
                icnUrl: aboutUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "share_app".tr,
                icnUrl: shareUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "dark_mode".tr,
                icnUrl: modeUrl,
                onTap: () {},
              ),
              IconMenu(
                title: "language".tr,
                icnUrl: Get.locale?.languageCode == "en" ? khUrl : enUrl,
                onTap: () {
                  if (Get.locale?.languageCode == "en") {
                    var locale = Locale('kh', 'kh_KM');
                    Get.updateLocale(locale);
                  } else {
                    var locale = Locale('en', 'en_US');
                    Get.updateLocale(locale);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
