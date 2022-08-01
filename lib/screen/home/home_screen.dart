// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/screen/home/main_screen.dart';
import 'package:flutter_desktop/screen/partials/sidebar/sidebar_partial.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MainScreen(),
        SidebarPartial(),
      ]),
    );
  }
}
