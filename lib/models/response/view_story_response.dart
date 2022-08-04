import 'dart:convert';

ViewStoryResponse viewStoryResponseFromJson(String str) =>
    ViewStoryResponse.fromJson(json.decode(str));

String viewStoryResponseToJson(ViewStoryResponse data) =>
    json.encode(data.toJson());

class ViewStoryResponse {
  ViewStoryResponse({
    required this.photo,
    required this.user,
    required this.date,
    required this.view,
    required this.viewers,
  });

  Photo photo;
  User user;
  String date;
  int view;
  List<User> viewers;

  factory ViewStoryResponse.fromJson(Map<String, dynamic> json) =>
      ViewStoryResponse(
        photo: Photo.fromJson(json["photo"]),
        user: User.fromJson(json["user"]),
        date: json["date"],
        view: json["view"],
        viewers: List<User>.from(json["viewers"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photo": photo.toJson(),
        "user": user.toJson(),
        "date": date,
        "view": view,
        "viewers": List<dynamic>.from(viewers.map((x) => x.toJson())),
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
        url: json["url"],
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
