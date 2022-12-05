import 'package:get/get.dart';

class TestLogic extends GetxController {
  @override
  void onReady() {
    print('进入Test');
  }

  @override
  void onClose() {
    print("控制器被释放222");
    super.onClose();
  }
}
