// To parse this JSON data, do
//
//     final qrCodeResponse = qrCodeResponseFromJson(jsonString);

import 'dart:convert';

QrCodeResponse qrCodeResponseFromJson(String str) =>
    QrCodeResponse.fromJson(json.decode(str));

String qrCodeResponseToJson(QrCodeResponse data) => json.encode(data.toJson());

class QrCodeResponse {
  QrCodeResponse({
    required this.qrcodeUrl,
    required this.profileUrl,
  });

  String qrcodeUrl;
  String profileUrl;

  factory QrCodeResponse.fromJson(Map<String, dynamic> json) => QrCodeResponse(
        qrcodeUrl: json["qrcode_url"],
        profileUrl: json["profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "qrcode_url": qrcodeUrl,
        "profile_url": profileUrl,
      };
}
