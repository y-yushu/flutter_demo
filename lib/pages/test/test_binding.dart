import 'package:flutter_demo/pages/test/test_logic.dart';
import 'package:get/get.dart';

// import 'test_view.dart';
import 'test_logic.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestLogic());
  }
}
