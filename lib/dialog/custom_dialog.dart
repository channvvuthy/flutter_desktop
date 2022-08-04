import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget dialogWidget;
  const CustomDialog({
    Key? key,
    required this.dialogWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogWidget,
    );
  }
}
