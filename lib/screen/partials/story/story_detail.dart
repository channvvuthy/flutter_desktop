import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text("Close")),
    );
  }
}
