import 'package:vla/src/helpers/network/endpoints.dart';

import 'network/network_manager.dart';

class UtilityHelper {
  Future<bool> getMarketCheck() async {
    var input = {"operation": "MarketCheck"};
    var response = await NetworkManager.instance.getDio().post(Endpoints.marketCheck, data: input);
    try {
      return response.data['MStatus'];
    } catch (e) {
      return false;
    }
  }

  Future<bool> getPincodeCheck({required String pincode}) async {
    var input = {"operation": "PincodeCheck", "Pincode": pincode};
    var response = await NetworkManager.instance.getDio().post(Endpoints.pincodeCheck, data: input);
    try {
      return response.data['PinCStatus'];
    } catch (e) {
      return false;
    }
  }
}
