import 'package:get/get.dart';
import 'package:vla/src/helpers/status_helper.dart';

import '../controllers/auth_controller.dart';

class AppManager {
  static StatusHelper statusHelper = StatusHelper();
  static AuthController authController = Get.find<AuthController>();
}
