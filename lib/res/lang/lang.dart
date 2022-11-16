import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter_demo/res/lang/zh_CN.dart';
import 'package:flutter_demo/res/lang/en_US.dart';

class Messages extends Translations {
  // 系统语言
  static Locale? get locale => Get.deviceLocale;
  // 无系统语言时默认语言
  static const fallbackLocale = Locale('zh', 'CN');

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}

class StrRes {
  static get hello => 'hello'.tr;
}
