import 'dart:convert';

ViewStoryResponse viewStoryResponseFromJson(String str) =>
    ViewStoryResponse.fromJson(json.decode(str));

String viewStoryResponseToJson(ViewStoryResponse data) =>
    json.encode(data.toJson());

class ViewStoryResponse {
  ViewStoryResponse({
    required this.id,
    required this.viewer,
    required this.photo,
    required this.date,
    required this.v,
    required this.s3Migrate,
    required this.view,
    required this.user,
  });

  String id;
  List<User> viewer;
  Photo photo;
  String date;
  int v;
  int s3Migrate;
  int view;
  User user;

  factory ViewStoryResponse.fromJson(Map<String, dynamic> json) =>
      ViewStoryResponse(
        id: json["_id"],
        viewer: List<User>.from(json["viewer"].map((x) => User.fromJson(x))),
        photo: Photo.fromJson(json["photo"]),
        date: json["date"],
        v: json["__v"],
        s3Migrate: json["s3_migrate"],
        view: json["view"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "viewer": List<dynamic>.from(viewer.map((x) => x.toJson())),
        "photo": photo.toJson(),
        "date": date,
        "__v": v,
        "s3_migrate": s3Migrate,
        "view": view,
        "user": user.toJson(),
      };
}

class Photo {
  Photo({
    required this.width,
    required this.height,
    required this.url,
  });

  int width;
  int height;
  String url;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
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
