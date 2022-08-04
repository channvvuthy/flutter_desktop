import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.lastName,
    required this.firstName,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOs,
    required this.playerId,
    required this.appVersion,
    required int acceptedPostPolicy,
  });

  String lastName;
  String firstName;
  String phone;
  String password;
  String confirmPassword;
  String gender;
  String deviceId;
  String deviceName;
  String deviceOs;
  String playerId;
  String appVersion;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        lastName: json["last_name"],
        firstName: json["first_name"],
        phone: json["phone"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        gender: json["gender"],
        deviceId: json["device_id"],
        deviceName: json["device_name"],
        deviceOs: json["device_os"],
        playerId: json["player_id"],
        appVersion: json["app_version"],
        acceptedPostPolicy: 0,
      );

  Map<String, dynamic> toJson() => {
        "last_name": lastName,
        "first_name": firstName,
        "phone": phone,
        "password": password,
        "confirm_password": confirmPassword,
        "gender": gender,
        "device_id": deviceId,
        "device_name": deviceName,
        "device_os": deviceOs,
        "player_id": playerId,
        "app_version": appVersion,
      };
}
