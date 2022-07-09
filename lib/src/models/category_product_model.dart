import 'dart:convert';

import 'package:flutter/material.dart';

CategoryProductResponseModel categoryProductResponseModelFromJson(String str) =>
    CategoryProductResponseModel.fromJson(json.decode(str));

String categoryProductResponseModelToJson(CategoryProductResponseModel data) => json.encode(data.toJson());

class CategoryProductResponseModel {
  CategoryProductResponseModel({
    required this.message,
    required this.result,
    required this.data,
  });

  String message;
  String result;
  List<CategoryProductData> data;

  factory CategoryProductResponseModel.fromJson(Map<String, dynamic> json) => CategoryProductResponseModel(
        message: json["message"],
        result: json["result"],
        data: List<CategoryProductData>.from(json["data"].map((x) => CategoryProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryProductData {
  CategoryProductData(
      {required this.name,
      required this.price,
      required this.length,
      required this.averageWeight,
      required this.calculatedWeight,
      required this.category,
      required this.productID,
      required this.piece,
      required this.ton});

  String name;
  String price;
  String length;
  String productID;
  TextEditingController ton;
  TextEditingController piece;
  String averageWeight;
  String calculatedWeight;
  String category;

  factory CategoryProductData.fromJson(Map<String, dynamic> json) => CategoryProductData(
      name: json["Name"],
      price: json["Price"],
      length: json["Length"].toString(),
      averageWeight: json["AverageWeight"],
      calculatedWeight: json["CalculatedWeight"].toString(),
      category: json["Category"],
      productID: json["ProductID"],
      ton: TextEditingController(),
      piece: TextEditingController());

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Length": length,
        "AverageWeight": averageWeight,
        "CalculatedWeight": calculatedWeight,
        "Category": category,
        "ProductID": productID
      };
}
