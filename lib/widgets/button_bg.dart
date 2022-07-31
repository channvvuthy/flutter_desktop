// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class ButtonBg extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  bool isLoading;
  ButtonBg(
      {Key? key,
      required this.txt,
      required this.onTap,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: PRIMARY_COLOR),
        child: isLoading == false
            ? Text(
                txt,
                style: TextStyle(color: WHITE_COLOR),
              )
            : SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: WHITE_COLOR,
                ),
              ),
      ),
    );
  }
}
