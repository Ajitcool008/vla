
import 'package:get/get.dart';

import '../helpers/network/endpoints.dart';
import '../helpers/network/network_manager.dart';
import '../models/marketprice_response_model.dart';

class MarketPriceController extends GetxController{
  RxList<MarketPriceData> marketpriceData = <MarketPriceData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  void getHomeData() async {
    var input = {"operation": "MarketPrice",
                   "market": "73"};
    var response = await NetworkManager.instance.getDio().post(Endpoints.marketprice, data: input);
    var resData = MarketPriceResponseModel.fromJson(response.data);
    marketpriceData.value = resData.data;
  }

}