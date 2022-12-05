import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/router/app_navigator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeLogic extends GetxController {
  // 阻止默认关闭应用
  int _now1 = 0;
  Future<bool> onWillPop() {
    int now2 = DateTime.now().millisecondsSinceEpoch;
    if (now2 - _now1 > 1000) {
      _now1 = now2;
      Fluttertoast.showToast(
        msg: '退出应用？',
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.BOTTOM_RIGHT,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  // 点击浮动按钮
  void clickFloatingActionButton() {
    AppNavigator.toTest();
  }
}
