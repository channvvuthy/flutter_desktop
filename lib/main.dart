// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/config/config.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/local/local_tran.dart';
import 'package:flutter_desktop/screen/auth/login_screen.dart';
import 'package:flutter_desktop/screen/auth/profile_screen.dart';
import 'package:flutter_desktop/screen/auth/register_screen.dart';
import 'package:flutter_desktop/screen/gallery/gallery_screen.dart';
import 'package:flutter_desktop/screen/home/home_screen.dart';
import 'package:flutter_desktop/screen/loading/loading_screen.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.maximize();
  windowManager.setTitle(appName);
  runApp(GetMaterialApp(
    translations: LocalTran(),
    locale: Locale("en", "US"),
    theme: ThemeData(
        fontFamily: "Ubuntu",
        backgroundColor: WHITE_COLOR,
        brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
    initialRoute: "/loading_screen",
    getPages: [
      GetPage(name: "/loading_screen", page: () => LoadingScreen()),
      GetPage(name: "/login_screen", page: () => LoginScreen()),
      GetPage(name: "/home_screen", page: () => HomeScreen()),
      GetPage(name: "/register_screen", page: () => RegisterScreen()),
      GetPage(name: "/gallery_screen", page: () => GalleryScreen()),
      GetPage(name: "/profile_screen", page: () => ProfileScreen()),
    ],
  ));
}
