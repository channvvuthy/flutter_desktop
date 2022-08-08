import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.phone,
    required this.gender,
    required this.photo,
    required this.story,
    this.school,
    this.province,
    required this.dateOfBirth,
    required this.token,
    required this.inCart,
    required this.acceptedPostPolicy,
  });

  String id;
  String lastName;
  String firstName;
  int phone;
  String gender;
  String photo;
  String story;
  Province? school;
  Province? province;
  String dateOfBirth;
  String token;
  int inCart;
  int acceptedPostPolicy;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        lastName: json["last_name"],
        firstName: json["first_name"],
        phone: json["phone"],
        gender: json["gender"],
        photo: json["photo"],
        story: json["story"],
        school: Province.fromJson(json["school"]),
        province: Province.fromJson(json["province"]),
        dateOfBirth: json["date_of_birth"],
        token: json["token"],
        inCart: json["in_cart"],
        acceptedPostPolicy: json["accepted_post_policy"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "last_name": lastName,
        "first_name": firstName,
        "phone": phone,
        "gender": gender,
        "photo": photo,
        "story": story,
        "school": school?.toJson(),
        "province": province?.toJson(),
        "date_of_birth": dateOfBirth,
        "token": token,
        "in_cart": inCart,
        "accepted_post_policy": acceptedPostPolicy,
      };
}

class Province {
  Province({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
