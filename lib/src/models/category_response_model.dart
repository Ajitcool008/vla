import 'dart:convert';

CategoryResponseModel categoryResponseModelFromJson(String str) => CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  CategoryResponseModel({
    required this.message,
    required this.result,
    required this.data,
  });

  String message;
  String result;
  List<CategoryData> data;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
        message: json["message"],
        result: json["result"],
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result,
        "data": List<CategoryData>.from(data.map((x) => x.toJson())),
      };
}

class CategoryData {
  CategoryData({
    required this.recordId,
    required this.name,
    required this.isSelected,
  });

  String recordId;
  String name;
  bool isSelected;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      CategoryData(recordId: json["RecordID"], name: json["Name"], isSelected: json["isSelected"] ?? false);

  Map<String, dynamic> toJson() => {"RecordID": recordId, "Name": name, "isSelected": isSelected};
}
