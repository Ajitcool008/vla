import 'package:get_storage/get_storage.dart';
import '../constants/string_constants.dart';
import '../models/login_response_model.dart';

class StatusHelper {
  void setLoginStatus(bool status) {
    GetStorage().write(Constants.loginStatus, status);
  }

  bool get getLoginStatus {
    if (GetStorage().read(Constants.loginStatus) == null) {
      return false;
    } else {
      return GetStorage().read(Constants.loginStatus);
    }
  }
}

class LoginDetails {
  void setLoginDetails(LoginModelResponse model) {
    GetStorage().write('StudentList', model.toJson());
  }

  LoginModelResponse restoreStudentListModel() {
    final map = GetStorage().read('StudentList') ?? {};
    return LoginModelResponse.fromJson(map);
  }
}
