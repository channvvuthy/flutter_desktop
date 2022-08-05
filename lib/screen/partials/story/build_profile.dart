// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';

buildProfile(String photo) {
  try {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 15),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: FB_COLOR),
          image: DecorationImage(
              image: photo.contains("http")
                  ? NetworkImage(photo)
                  : AssetImage(eschoolUrl) as ImageProvider),
          borderRadius: BorderRadius.circular(80),
        ));
  } catch (err) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 15),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: FB_COLOR),
          image: DecorationImage(image: AssetImage(eschoolUrl)),
          borderRadius: BorderRadius.circular(80),
        ));
  }
}
