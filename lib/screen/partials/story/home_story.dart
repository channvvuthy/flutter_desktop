// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/story_controller.dart';
import 'package:flutter_desktop/models/response/story_response.dart';
import 'package:get/get.dart';

class HomeStory extends StatefulWidget {
  const HomeStory({Key? key}) : super(key: key);

  @override
  State<HomeStory> createState() => _HomeStoryState();
}

class _HomeStoryState extends State<HomeStory> {
  StoryController storyCtrl = Get.put(StoryController());

  @override
  void initState() {
    super.initState();
    storyCtrl.getStory();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 150,
          child: storyCtrl.isLoading.isTrue
              ? Text("data")
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: storyCtrl.stories.length,
                  itemBuilder: (((context, index) {
                    StoryResponse story =
                        StoryResponse.fromJson(storyCtrl.stories[index]);
                    return Column(children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: story.photo.url != ""
                                    ? NetworkImage(story.photo.url)
                                    : AssetImage(eschoolUrl) as ImageProvider),
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [
                                Colors.black26,
                                Colors.black26,
                              ],
                            )),
                        child: Stack(children: [
                          Container(
                              clipBehavior: Clip.hardEdge,
                              margin: EdgeInsets.only(right: 15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(width: 4, color: FB_COLOR),
                                image: DecorationImage(
                                    image: story.user.photo != ""
                                        ? NetworkImage(story.user.photo)
                                        : AssetImage(eschoolUrl)
                                            as ImageProvider),
                                borderRadius: BorderRadius.circular(80),
                              )),
                        ]),
                      )
                    ]);
                  }))),
        ));
  }
}
