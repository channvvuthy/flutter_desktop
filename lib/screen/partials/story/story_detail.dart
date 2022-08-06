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
  final int index;
  StoryDetail({
    Key? key,
    required this.story,
    required this.index,
  }) : super(key: key);

  @override
  State<StoryDetail> createState() => _StoryDetailState();
}

class _StoryDetailState extends State<StoryDetail> {
  StoryController storyCtrl = Get.put(StoryController());
  ScrollController controller = ScrollController();

  int index = 0;
  late StoryResponse story;

  @override
  void initState() {
    super.initState();
    viewStory(widget.index);
    index = widget.index;

    setState(() {
      story = widget.story;
    });

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        storyCtrl.p.value++;
        viewStory(index);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void viewStory(int index) async {
    story = StoryResponse.fromJson(storyCtrl.stories[index]);
    await storyCtrl.viewStory(story.id);
  }

  void nextStory() {
    storyCtrl.p.value = 1;
    if (storyCtrl.stories.length > index) {
      setState(() {
        index++;
        viewStory(index);
      });
    }
  }

  void prevStory() {
    storyCtrl.p.value = 1;
    if (index > 0) {
      setState(() {
        index--;
        viewStory(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(children: [
          Expanded(
            flex: 1,
              child: Visibility(
                visible: index > 0,
                child: Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(color: ICON_COLOR,borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.navigate_before),
                ),
                  ),),
              )),
          Container(
            width: 500,
            height: screen.height* 0.89,
            color: WHITE_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: FB_COLOR,width: 4),
                      borderRadius: BorderRadius.circular(40),
                      color: ICON_COLOR,
                      image: DecorationImage(
                        image: NetworkImage(story.user.photo)
                      )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(story.user.name,style: TextStyle(fontFamily: fontFamiliy()),),
                    SizedBox(height: 5,),
                    Obx(() => Text(storyCtrl.isViewing.isTrue ? "Loading..." : DateFormat("MM/dd/yy h:mm a").format(DateTime.parse(story.date)).toString()))
                  ],),
                ],),
                SizedBox(height: 15,),
                Expanded(flex: 1, child: SingleChildScrollView(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  child: CachedNetworkImage(
                      imageUrl: UrlHelper.url(story.photo.url),
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                                color: WHITE_COLOR, value: downloadProgress.progress),
                          ),
                      errorWidget: (context, url, error) => Image.asset(eschoolUrl)
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(children: [
                   Obx(() =>  countViewer(storyCtrl.story.value["view"].toString())),
                  ],),
                )
              ],),
            ),
          ),
         Expanded(
           flex: 1,
             child:  Container(
               alignment: Alignment.center,
               child: InkWell(
                 onTap: (){},
                 child: Container(
                   alignment: Alignment.center,
                   width: 30,
                   height: 30,
                   decoration: BoxDecoration(color: ICON_COLOR,borderRadius: BorderRadius.circular(20)),
                   child: Icon(Icons.navigate_next),
                 ),
               ),)),

        ],)],),
        Positioned(
          right: screen.width * 0.29,
            top: 0,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
          width: 35,height: 35,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: ICON_COLOR
        ),
          child: Icon(Icons.close),),
            ))

      ],),
    );
  }
}

Widget countViewer(String viewer) {
  return Row(children: [
    Icon(
      Icons.remove_red_eye,
      color: ICON_COLOR,
    ),
    SizedBox(
      width: 5,
    ),
    Text(viewer),
    SizedBox(
      width: 5,
    ),
    Text("views".tr)
  ]);
}
