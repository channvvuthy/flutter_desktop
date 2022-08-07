// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/controllers/gallery_controller.dart';
import 'package:flutter_desktop/helper/url_helper.dart';
import 'package:flutter_desktop/models/response/story_response.dart';
import 'package:flutter_desktop/screen/partials/widgets/box_shadow.dart';
import 'package:get/get.dart';

class GalleryScreenList extends StatefulWidget {
  const GalleryScreenList({Key? key}) : super(key: key);

  @override
  State<GalleryScreenList> createState() => _GalleryScreenListState();
}

class _GalleryScreenListState extends State<GalleryScreenList> {
  GalleryController galleryCtrl = Get.put(GalleryController());
  ScrollController scrollStory = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      getStory();
    });
  }

  void getStory() async {
    await galleryCtrl.getStory();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: screen.width,
      height: screen.height,
      child: Obx(() => galleryCtrl.isLoading.isTrue
          ? GridView.builder(
              controller: scrollStory,
              itemCount: 18,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black26,
                            Colors.black26,
                          ],
                        )),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            child: CircularProgressIndicator(
                          color: WHITE_COLOR,
                        ))
                      ],
                    ));
              })
          : GridView.builder(
              controller: scrollStory,
              itemCount: galleryCtrl.galleries.value.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                StoryResponse gallery =
                    StoryResponse.fromJson(galleryCtrl.galleries.value[index]);
                return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black26,
                            Colors.black26,
                          ],
                        )),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ICON_COLOR,
                              boxShadow: [boxShadow(0, 1), boxShadow(1, 0)]),
                          child: CachedNetworkImage(
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            imageUrl: UrlHelper.url(gallery.photo.url),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                  color: WHITE_COLOR,
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset(eschoolUrl),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            top: 10,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(width: 4, color: FB_COLOR),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      image: NetworkImage(gallery.user.photo))),
                            ))
                      ],
                    ));
              })),
    );
  }
}
