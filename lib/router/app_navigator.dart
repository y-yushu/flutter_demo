import 'package:get/get.dart';

import 'app_pages.dart';

class AppNavigator {
  // 去首页
  static void toHome() {
    Get.offAllNamed(AppRoutes.HOME);
  }

  // 去测试页
  static void toTest() {
    Get.toNamed(AppRoutes.TEST);
  }
}
