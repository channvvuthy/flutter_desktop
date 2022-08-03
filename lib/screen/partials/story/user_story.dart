// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/models/response/story_response.dart';

class UserStory extends StatelessWidget {
  final StoryResponse story;
  const UserStory({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.only(left: 10, top: 10),
          width: 120,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: story.photo.url != ""
                      ? NetworkImage(story.photo.url)
                      : const AssetImage(eschoolUrl) as ImageProvider),
              borderRadius: BorderRadius.circular(12.0),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black26,
                  Colors.black26,
                ],
              )),
          child: Stack(children: [
            Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.only(right: 15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: FB_COLOR),
                  image: DecorationImage(
                      image: story.user.photo != ""
                          ? NetworkImage(story.user.photo)
                          : const AssetImage(eschoolUrl) as ImageProvider),
                  borderRadius: BorderRadius.circular(80),
                )),
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          story.user.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontFamily: fontFamiliy()),
        )
      ]),
    );
  }
}
