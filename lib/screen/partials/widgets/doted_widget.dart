import 'package:flutter/material.dart';

class DotedWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const DotedWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(height)),
    );
  }
}
