import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/network/endpoints.dart';
import '../helpers/network/network_manager.dart';
import '../models/category_product_model.dart';
import '../models/category_response_model.dart';
import '../models/product_price_response.dart';

class ProductController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldEy = GlobalKey<ScaffoldState>();
  RxList<CategoryData> categoryData = <CategoryData>[].obs;
  RxList<CategoryProductData> products = <CategoryProductData>[].obs;
  RxList<ProductPriceWeight> productCart = <ProductPriceWeight>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
  }

  void getCategoryData() async {
    var input = {"operation": "Category"};

    var response = await NetworkManager.instance.getDio().post(Endpoints.category, data: input);
    var categoryRes = CategoryResponseModel.fromJson(response.data);
    categoryData.value = categoryRes.data;
    categoryData.first.isSelected = true;
    getProductsData(categoryID: categoryData.first.recordId);
  }

  Future<void> getProductsData({required String categoryID}) async {
    var input = {"operation": "CategoryProducts", "category": categoryID};

    var response = await NetworkManager.instance.getDio().post(Endpoints.products, data: input);
    var productRes = CategoryProductResponseModel.fromJson(response.data);
    products.value = productRes.data;
  }

  Future<ProductPriceWeight> getProductVal({required Map<String, dynamic> input}) async {
    var response = await NetworkManager.instance.getDio().post(Endpoints.productPrice, data: input);
    var productRes = ProductPriceResponseModel.fromJson(response.data);
    return productRes.data.first;
  }

  void addCart({required ProductPriceWeight item}) {
    productCart.add(item);
  }

  void removeCart({required ProductPriceWeight item}) {
    productCart.remove(item);
  }
}
