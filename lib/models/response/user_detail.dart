import 'dart:convert';

UserDetail userDetailFromJson(String str) =>
    UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.gender,
    required this.photo,
    required this.schoolName,
    required this.provinceName,
    required this.friend,
    required this.roomId,
  });

  String id;
  String lastName;
  String firstName;
  String gender;
  String photo;
  String schoolName;
  String provinceName;
  int friend;
  String roomId;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["_id"],
        lastName: json["last_name"],
        firstName: json["first_name"],
        gender: json["gender"],
        photo: json["photo"],
        schoolName: json["school_name"],
        provinceName: json["province_name"],
        friend: json["friend"],
        roomId: json["room_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "last_name": lastName,
        "first_name": firstName,
        "gender": gender,
        "photo": photo,
        "school_name": schoolName,
        "province_name": provinceName,
        "friend": friend,
        "room_id": roomId,
      };
}
