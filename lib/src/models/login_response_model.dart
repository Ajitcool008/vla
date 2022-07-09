import 'dart:convert';

LoginModelResponse loginModelResponseFromJson(String str) => LoginModelResponse.fromJson(json.decode(str));

String loginModelResponseToJson(LoginModelResponse data) => json.encode(data.toJson());

class LoginModelResponse {
  LoginModelResponse({
    required this.message,
    required this.result,
    required this.token,
    required this.csuid,
    this.data,
    required this.expireAt,
  });

  String message;
  String result;
  String token;
  String csuid;
  Data? data;
  String expireAt;

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) => LoginModelResponse(
        message: json["message"],
        result: json["result"],
        token: json["token"] ?? "",
        csuid: json["csuid"] ?? '',
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        expireAt: json["expireAt"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result,
        "token": token,
        "csuid": csuid,
        "data": data?.toJson(),
        "expireAt": expireAt,
      };
}

class Data {
  Data({
    required this.name,
    required this.pincode,
    required this.isUserVerified,
  });

  String name;
  String pincode;
  String isUserVerified;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["Name"],
        pincode: json["Pincode"],
        isUserVerified: json["IsUserVerified"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Pincode": pincode,
        "IsUserVerified": isUserVerified,
      };
}
