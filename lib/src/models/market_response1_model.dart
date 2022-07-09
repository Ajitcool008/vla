// import 'dart:convert';
//
// MarketResponseModel marketResponseModelFromJson(String str) =>
//     MarketResponseModel.fromJson(json.decode(str));
//
// String marketResponseModelToJson(MarketResponseModel data) => json.encode(data.toJson());
//
// class MarketResponseModel {
//   MarketResponseModel({
//     required this.message,
//     required this.result,
//     required this.data,
//   });
//
//   String message;
//   String result;
//   List<ProductsData> data;
//
//   factory MarketResponseModel.fromJson(Map<String, dynamic> json) => MarketResponseModel(
//         message: json["message"],
//         result: json["result"],
//         data: List<ProductsData>.from(json["data"].map((x) => ProductsData.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "result": result,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
//
// class ProductsData {
//   ProductsData({
//     required this.name,
//     required this.price,
//   });
//
//   String name;
//   String price;
//
//   factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
//         name: json["Name"],
//         price: json["Price"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Name": name,
//         "Price": price,
//       };
// }
