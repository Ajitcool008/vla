import 'package:get/get.dart';

import '../helpers/network/endpoints.dart';
import '../helpers/network/network_manager.dart';
import '../models/market_response_model.dart';

class HomeController extends GetxController {
  RxList<ProductsData> productData = <ProductsData>[].obs;
  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  void getHomeData() async {
    var input = {"operation": "market"};
    var response = await NetworkManager.instance.getDio().post(Endpoints.market, data: input);
    var resData = MarketResponseModel.fromJson(response.data);
    productData.value = resData.data;
  }
}
