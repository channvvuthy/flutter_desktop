import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.phone,
    required this.password,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOs,
    required this.playerId,
    required this.appVersion,
    required this.acceptedPostPolicy,
  });

  int phone;
  String password;
  String deviceId;
  String deviceName;
  String deviceOs;
  String playerId;
  String appVersion;
  int acceptedPostPolicy;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        phone: json["phone"],
        password: json["password"],
        deviceId: json["device_id"],
        deviceName: json["device_name"],
        deviceOs: json["device_os"],
        playerId: json["player_id"],
        appVersion: json["app_version"],
        acceptedPostPolicy: json["accepted_post_policy"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "device_id": deviceId,
        "device_name": deviceName,
        "device_os": deviceOs,
        "player_id": playerId,
        "app_version": appVersion,
        "accepted_post_policy": acceptedPostPolicy,
      };
}
