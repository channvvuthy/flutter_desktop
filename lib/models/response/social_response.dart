import 'dart:convert';

List<SocialResponse> socialResponseFromJson(String str) =>
    List<SocialResponse>.from(
        json.decode(str).map((x) => SocialResponse.fromJson(x)));

String socialResponseToJson(List<SocialResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocialResponse {
  SocialResponse({
    required this.id,
    required this.type,
    required this.caption,
    required this.photo,
    required this.thumbnail,
    required this.video,
    required this.live,
    required this.user,
    required this.date,
    required this.isLike,
    required this.isEdit,
    required this.isFavorite,
    required this.total,
    required this.liker,
  });

  String id;
  int type;
  String caption;
  List<Thumbnail> photo;
  Thumbnail thumbnail;
  List<Live> video;
  List<Live> live;
  User user;
  DateTime date;
  bool isLike;
  bool isEdit;
  bool isFavorite;
  Total total;
  List<User> liker;

  factory SocialResponse.fromJson(Map<String, dynamic> json) => SocialResponse(
        id: json["_id"],
        type: json["type"],
        caption: json["caption"],
        photo: List<Thumbnail>.from(
            json["photo"].map((x) => Thumbnail.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        video: List<Live>.from(json["video"].map((x) => Live.fromJson(x))),
        live: List<Live>.from(json["live"].map((x) => Live.fromJson(x))),
        user: User.fromJson(json["user"]),
        date: DateTime.parse(json["date"]),
        isLike: json["is_like"],
        isEdit: json["is_edit"],
        isFavorite: json["is_favorite"],
        total: Total.fromJson(json["total"]),
        liker: List<User>.from(json["liker"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "caption": caption,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
        "thumbnail": thumbnail.toJson(),
        "video": List<dynamic>.from(video.map((x) => x.toJson())),
        "live": List<dynamic>.from(live.map((x) => x.toJson())),
        "user": user.toJson(),
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "is_like": isLike,
        "is_edit": isEdit,
        "is_favorite": isFavorite,
        "total": total.toJson(),
        "liker": List<dynamic>.from(liker.map((x) => x.toJson())),
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

class Live {
  Live({
    required this.url,
    required this.quality,
  });

  String url;
  String quality;

  factory Live.fromJson(Map<String, dynamic> json) => Live(
        url: json["url"],
        quality: json["quality"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "quality": quality,
      };
}

class Thumbnail {
  Thumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
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

class Total {
  Total({
    required this.seen,
    required this.like,
    required this.comment,
    required this.concurrent,
  });

  int seen;
  int like;
  int comment;
  int concurrent;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        seen: json["seen"],
        like: json["like"],
        comment: json["comment"],
        concurrent: json["concurrent"],
      );

  Map<String, dynamic> toJson() => {
        "seen": seen,
        "like": like,
        "comment": comment,
        "concurrent": concurrent,
      };
}
