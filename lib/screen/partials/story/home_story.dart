// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/controllers/story_controller.dart';
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
    return Obx(() => SizedBox(
          height: 180,
          width: double.infinity,
          child: storyCtrl.isLoading.isTrue
              ? Text("Loading")
              : ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12.0),
                  children: [
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Color.fromARGB(66, 117, 115, 115)),
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black26],
                          )),
                      child: const Center(child: Text('Entry A')),
                    )
                  ],
                ),
        ));
  }
}
