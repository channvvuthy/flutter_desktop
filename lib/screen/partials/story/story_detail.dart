// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/story_controller.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/helper/url_helper.dart';
import 'package:flutter_desktop/models/response/story_response.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StoryDetail extends StatefulWidget {
  final StoryResponse story;
  StoryDetail({
    Key? key,
    required this.story,
  }) : super(key: key);

  @override
  State<StoryDetail> createState() => _StoryDetailState();
}

class _StoryDetailState extends State<StoryDetail> {
  StoryController storyCtrl = Get.put(StoryController());

  @override
  void initState() {
    super.initState();
    storyCtrl.viewStory(widget.story.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          color: WHITE_COLOR,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: FB_COLOR, width: 4),
                                  image: DecorationImage(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          widget.story.user.photo))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.story.user.name,
                                  style: TextStyle(fontFamily: fontFamiliy()),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Text(
                                      storyCtrl.isViewing.isTrue
                                          ? "Loading..."
                                          : DateFormat("dd/MM/yy hh:mm a")
                                              .format(DateTime.parse(
                                                  storyCtrl.story['date'])),
                                      style:
                                          TextStyle(fontFamily: fontFamiliy()),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: CachedNetworkImage(
                            imageUrl: UrlHelper.url(widget.story.photo.url),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset(eschoolUrl),
                          ),
                        )),
                    Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Row(children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: ICON_COLOR,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Obx(() => Text(storyCtrl.isViewing.isTrue
                                ? "0"
                                : storyCtrl.story["view"].toString())),
                            SizedBox(
                              width: 5,
                            ),
                            Text("views".tr)
                          ]),
                        ))
                  ]),
            ),
          ]),
        ),
        Positioned(
            right: -15,
            top: -15,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ICON_COLOR, borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.close),
            ))
      ]),
    );
  }
}
