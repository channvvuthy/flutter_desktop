// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/screen/partials/widgets/avatar_loading.dart';
import 'package:flutter_desktop/screen/partials/widgets/doted_widget.dart';

class LoadingSocial extends StatelessWidget {
  const LoadingSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: SOCIAL_BORDER)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AvatarLoadingWidget(
                    width: 70,
                    height: 70,
                    radius: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvatarLoadingWidget(width: 100, height: 10, radius: 0),
                      SizedBox(
                        height: 10,
                      ),
                      AvatarLoadingWidget(width: 80, height: 10, radius: 0),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  DotedWidget(width: 4, height: 4, color: BLACK_COLOR),
                  SizedBox(
                    height: 3,
                  ),
                  DotedWidget(width: 4, height: 4, color: BLACK_COLOR),
                  SizedBox(
                    height: 3,
                  ),
                  DotedWidget(width: 4, height: 4, color: BLACK_COLOR)
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarLoadingWidget(width: screenWidth, height: 10, radius: 0),
              SizedBox(
                height: 12,
              ),
              AvatarLoadingWidget(
                  width: (screenWidth * 0.6), height: 10, radius: 0),
              SizedBox(
                height: 12,
              ),
              AvatarLoadingWidget(
                  width: (screenWidth * 0.5), height: 10, radius: 0),
              SizedBox(
                height: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
