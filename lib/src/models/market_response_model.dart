// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MarketResponseModel marketResponseModelFromJson(String str) =>
    MarketResponseModel.fromJson(json.decode(str));

String marketResponseModelToJson(MarketResponseModel data) => json.encode(data.toJson());

class MarketResponseModel {
  MarketResponseModel({
    required this.message,
    required this.result,
    required this.data,
  });

  String message;
  String result;
  List<ProductsData> data;

  factory MarketResponseModel.fromJson(Map<String, dynamic> json) => MarketResponseModel(
    message: json["message"],
    result: json["result"],
    data: List<ProductsData>.from(json["data"].map((x) => ProductsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductsData {
  ProductsData({
    required this.recordId,
    required this.name,
    required this.price,
    required this.data,
  });

  String recordId;
  String name;
  String price;
  List<ProductsDataElement> data;

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
    recordId: json["RecordID"],
    name: json["Name"],
    price: json["Price"],
    data: List<ProductsDataElement>.from(json["Data"].map((x) => ProductsDataElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RecordID": recordId,
    "Name": name,
    "Price": price,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductsDataElement {
  ProductsDataElement({
    required this.name,
    required this.price,
    required this.dateTime,
  });

  String name;
  String price;
  DateTime dateTime;

  factory ProductsDataElement.fromJson(Map<String, dynamic> json) => ProductsDataElement(
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
