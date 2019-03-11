// To parse this JSON data, do
//
//     final sfAuthResponse = sfAuthResponseFromJson(jsonString);

import 'dart:convert';

SfAuthResponse sfAuthResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return SfAuthResponse.fromJson(jsonData);
}

String sfAuthResponseToJson(SfAuthResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SfAuthResponse {
  String accessToken;
  String instanceUrl;
  String id;
  String tokenType;
  String issuedAt;
  String signature;
  String username;

  SfAuthResponse({
    this.accessToken,
    this.instanceUrl,
    this.id,
    this.tokenType,
    this.issuedAt,
    this.signature,
    this.username,
  });

  factory SfAuthResponse.fromJson(Map<String, dynamic> json) =>
      new SfAuthResponse(
    accessToken: json["access_token"],
    instanceUrl: json["instance_url"],
    id: json["id"],
    tokenType: json["token_type"],
    issuedAt: json["issued_at"],
    signature: json["signature"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "instance_url": instanceUrl,
    "id": id,
    "token_type": tokenType,
    "issued_at": issuedAt,
    "signature": signature,
  };
}
