// To parse this JSON data, do
//
//     final storyResponse = storyResponseFromJson(jsonString);

import 'dart:convert';

StoryResponse storyResponseFromJson(String str) =>
    StoryResponse.fromJson(json.decode(str));

String storyResponseToJson(StoryResponse data) => json.encode(data.toJson());

class StoryResponse {
  StoryResponse({
    required this.id,
    required this.user,
    required this.photo,
    required this.date,
    required this.type,
  });

  String id;
  User user;
  Photo photo;
  String date;
  int type;

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        photo: Photo.fromJson(json["photo"]),
        date: json["date"] ?? "",
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "photo": photo.toJson(),
        "date": date,
        "type": type,
      };
}

class Photo {
  Photo({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"] ?? "",
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.photo,
  });

  String id;
  String name;
  String photo;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "photo": photo,
      };
}
