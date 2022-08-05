// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/dialog/custom_dialog.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/helper/url_helper.dart';
import 'package:flutter_desktop/models/response/story_response.dart';
import 'package:flutter_desktop/screen/partials/story/story_detail.dart';

class UserStory extends StatelessWidget {
  final StoryResponse story;
  UserStory({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => CustomDialog(
                  dialogWidget: StoryDetail(story: story),
                ));
      },
      child: Container(
        child: Column(children: [
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(right: 12),
            width: 120,
            height: 150,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black26,
                    Colors.black26,
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0)),
            child: Stack(children: [
              CachedNetworkImage(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                imageUrl: UrlHelper.url(story.photo.url),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Image.asset(eschoolUrl),
              ),
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
      ),
    );
  }
}
