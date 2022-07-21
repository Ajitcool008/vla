// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MarketPriceResponseModel marketpriceResponseModelFromJson(String str) => MarketPriceResponseModel.fromJson(json.decode(str));

String marketpriceResponseModelToJson(MarketPriceResponseModel data) => json.encode(data.toJson());

class MarketPriceResponseModel {
  MarketPriceResponseModel({
     required this.message,
     required this.result,
     required this.data,
  });

  String message;
  String result;
  List<MarketPriceData> data;

  factory MarketPriceResponseModel.fromJson(Map<String, dynamic> json) => MarketPriceResponseModel(
    message: json["message"],
    result: json["result"],
    data: List<MarketPriceData>.from(json["data"].map((x) => MarketPriceData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MarketPriceData {
  MarketPriceData({
    required this.name,
    required this.price,
    required this.dateTime,
  });

  String name;
  String price;
  DateTime dateTime;

  factory MarketPriceData.fromJson(Map<String, dynamic> json) => MarketPriceData(
    name: json["Name"],
    price: json["Price"],
    dateTime: DateTime.parse(json["DateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Price": price,
    "DateTime": dateTime.toIso8601String(),
  };
}
