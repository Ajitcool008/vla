// To parse this JSON data, do
//
//     final productPriceResponseModel = productPriceResponseModelFromJson(jsonString);

import 'dart:convert';

ProductPriceResponseModel productPriceResponseModelFromJson(String str) =>
    ProductPriceResponseModel.fromJson(json.decode(str));

String productPriceResponseModelToJson(ProductPriceResponseModel data) => json.encode(data.toJson());

class ProductPriceResponseModel {
  ProductPriceResponseModel({
    required this.message,
    required this.result,
    required this.data,
  });

  String message;
  String result;
  List<ProductPriceWeight> data;

  factory ProductPriceResponseModel.fromJson(Map<String, dynamic> json) => ProductPriceResponseModel(
        message: json["message"],
        result: json["result"],
        data: List<ProductPriceWeight>.from(json["data"].map((x) => ProductPriceWeight.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductPriceWeight {
  ProductPriceWeight({
    required this.name,
    required this.price,
    required this.calculatedPrice,
    required this.totalWeight,
    required this.totalWeightIntonnes,
    required this.totalPices,
    required this.length,
    required this.averageWeight,
    required this.calculatedWeight,
    required this.category,
  });

  String name;
  String price;
  int calculatedPrice;
  int totalWeight;
  int totalPices;
  String totalWeightIntonnes;
  String length;
  String averageWeight;
  String calculatedWeight;
  String category;

  factory ProductPriceWeight.fromJson(Map<String, dynamic> json) => ProductPriceWeight(
        name: json["Name"],
        price: json["Price"],
        calculatedPrice: json["CalculatedPrice"],
        totalWeight: json["TotalWeight"],
        totalPices: json["TotalPices"],
        length: json["Length"],
    totalWeightIntonnes: json["TotalWeightIntonnes"],
        averageWeight: json["AverageWeight"],
        calculatedWeight: json["CalculatedWeight"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "CalculatedPrice": calculatedPrice,
        "TotalWeight": totalWeight,
        "TotalPices": totalPices,
        "TotalWeightIntonnes": totalWeightIntonnes,
        "Length": length,
        "AverageWeight": averageWeight,
        "CalculatedWeight": calculatedWeight,
        "Category": category,
      };
}
