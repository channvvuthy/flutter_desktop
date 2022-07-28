import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';

class InputBorderOnlyBottom extends StatelessWidget {
  final String placeholder;
  final Icon icon;
  bool? isSecure;
  InputBorderOnlyBottom(
      {Key? key, required this.placeholder, required this.icon, this.isSecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: BLACK_COLOR, width: 2))),
    );
  }
}
