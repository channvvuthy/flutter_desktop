// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/auth_controller.dart';
import 'package:flutter_desktop/controllers/story_controller.dart';
import 'package:flutter_desktop/models/response/story_response.dart';
import 'package:flutter_desktop/screen/partials/story/auth_story.dart';
import 'package:flutter_desktop/screen/partials/story/loading_story.dart';
import 'package:flutter_desktop/screen/partials/story/user_story.dart';
import 'package:get/get.dart';

class HomeStory extends StatefulWidget {
  const HomeStory({Key? key}) : super(key: key);

  @override
  State<HomeStory> createState() => _HomeStoryState();
}

class _HomeStoryState extends State<HomeStory> {
  StoryController storyCtrl = Get.put(StoryController());
  AuthController authCtrl = Get.put(AuthController());
  ScrollController scrollStory = ScrollController();

  @override
  void initState() {
    super.initState();
    storyCtrl.getStory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 185,
      child: Row(children: [
        Container(
          child: AuthStory(),
        ),
        Obx(() => Expanded(
            child: storyCtrl.isLoading.isTrue
                ? ListView.builder(
                    controller: scrollStory,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return LoadingStory();
                    }))
                : ListView.builder(
                    controller: scrollStory,
                    scrollDirection: Axis.horizontal,
                    itemCount: storyCtrl.stories.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      StoryResponse story =
                          StoryResponse.fromJson(storyCtrl.stories[index]);
                      if (index < (storyCtrl.stories.length - 1)) {
                        return UserStory(
                          story: story,
                          index: index,
                        );
                      } else {
                        return Row(
                          children: [
                            UserStory(
                              story: story,
                              index: index,
                            ),
                            LoadingStory(
                              isSeeMore: true,
                            )
                          ],
                        );
                      }
                    }))))
      ]),
    );
  }
}
