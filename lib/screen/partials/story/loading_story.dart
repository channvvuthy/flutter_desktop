// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:get/get.dart';

class LoadingStory extends StatelessWidget {
  bool? isSeeMore;
  LoadingStory({Key? key, this.isSeeMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.only(left: 10, top: 10),
        width: 120,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black26,
                Colors.black26,
              ],
            )),
        child: isSeeMore == true
            ? InkWell(
                onTap: () {},
                child: Text(
                  "see_more".tr,
                  style: TextStyle(fontFamily: fontFamiliy()),
                ),
              )
            : const Text(""),
      ),
    ]));
  }
}
