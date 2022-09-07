// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/constant/color.dart';
import 'package:flutter_desktop/constant/url.dart';
import 'package:flutter_desktop/helper/font_family.dart';
import 'package:flutter_desktop/helper/null_helper.dart';
import 'package:flutter_desktop/helper/url_helper.dart';
import 'package:flutter_desktop/models/response/social_response.dart';
import 'package:flutter_desktop/screen/partials/widgets/avatar_widget.dart';
import 'package:flutter_desktop/screen/partials/widgets/doted_widget.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../helper/color _palette_generator.dart';
import '../../../helper/timeago_helper.dart';

class SocialContent extends StatelessWidget {
  final SocialResponse socialResponse;

  const SocialContent({
    Key? key,
    required this.socialResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(border: Border.all(color: SOCIAL_BORDER)),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AvatarWidget(
                      width: 70,
                      height: 70,
                      assetUrl: UrlHelper.url(socialResponse.user?.photo),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${socialResponse.user?.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: fontFamiliy()),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          TimeagoHelper.convertToAgo(
                              socialResponse.date.toString()),
                          style: TextStyle(color: ICON_COLOR, fontSize: 12),
                        )
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
            Visibility(
                visible: 'null' != socialResponse.caption.toString(),
                child: Text(
                  socialResponse.caption.toString(),
                  style: TextStyle(fontFamily: fontFamiliy()),
                )),
            Visibility(
              visible: 2 == socialResponse.type,
              child: Visibility(
                visible: NullHelper.nullArray(socialResponse.photo),
                child: Text(""),
              ),
            )
          ]),
    );
  }
}
