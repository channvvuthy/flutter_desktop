class SocialResponse {
  String? sId;
  Total? total;
  int? type;
  String? caption;
  List<Photo>? photo;
  Photo? video;
  User? user;
  String? date;
  int? isLike;
  int? isEdit;
  List<Liker>? liker;
  int? isFavorite;

  SocialResponse(
      {this.sId,
        this.total,
        this.type,
        this.caption,
        this.photo,
        this.video,
        this.user,
        this.date,
        this.isLike,
        this.isEdit,
        this.liker,
        this.isFavorite});

  SocialResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    total = json['total'] != null ? Total.fromJson(json['total']) : null;
    type = json['type'];
    caption = json['caption'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
    video = json['video'] != null ? Photo.fromJson(json['video']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    date = json['date'];
    isLike = json['is_like'];
    isEdit = json['is_edit'];
    if (json['liker'] != null) {
      liker = <Liker>[];
      json['liker'].forEach((v) {
        liker!.add(Liker.fromJson(v));
      });
    }
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (total != null) {
      data['total'] = total!.toJson();
    }
    data['type'] = type;
    data['caption'] = caption;
    if (photo != null) {
      data['photo'] = photo!.map((v) => v.toJson()).toList();
    }
    if (video != null) {
      data['video'] = video!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['date'] = date;
    data['is_like'] = isLike;
    data['is_edit'] = isEdit;
    if (liker != null) {
      data['liker'] = liker!.map((v) => v.toJson()).toList();
    }
    data['is_favorite'] = isFavorite;
    return data;
  }
}

class Total {
  int? seen;
  int? comment;
  int? like;
  int? concurrent;
  int? reported;

  Total({this.seen, this.comment, this.like, this.concurrent, this.reported});

  Total.fromJson(Map<String, dynamic> json) {
    seen = json['seen'];
    comment = json['comment'];
    like = json['like'];
    concurrent = json['concurrent'];
    reported = json['reported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seen'] = seen;
    data['comment'] = comment;
    data['like'] = like;
    data['concurrent'] = concurrent;
    data['reported'] = reported;
    return data;
  }
}

class Photo {
  int? height;
  String? url;
  int? width;

  Photo({this.height, this.url, this.width});

  Photo.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? photo;

  User({this.sId, this.name, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}

class Liker {
  String? sId;
  String? name;
  String? photo;

  Liker({this.sId, this.name, this.photo});

  Liker.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
