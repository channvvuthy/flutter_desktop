// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/screen/partials/social/social_post.dart';

class SocialBody extends StatefulWidget {
  const SocialBody({Key? key}) : super(key: key);

  @override
  State<SocialBody> createState() => _SocialBodyState();
}

class _SocialBodyState extends State<SocialBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: SocialPost()),
          Expanded(flex: 1, child: Text("Recommended Post"))
        ],
      ),
    );
  }
}
