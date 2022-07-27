// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/screen/loading/loading_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.maximize();
  runApp(MaterialApp(
    theme:
        ThemeData(backgroundColor: WHITE_COLOR, brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),
  ));
}
