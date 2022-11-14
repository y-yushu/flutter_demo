import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/res/lang/index.dart'; // 国际化
import 'package:flutter_demo/router/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // 主题
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      translations: Messages(),
      locale: Messages.locale, // 设置默认语言
      fallbackLocale: Messages.fallbackLocale, // 错误配置时使用语言
      getPages: AppPages.routes,
      initialBinding: InitBinding(),
      initialRoute: AppRoutes.HOME,
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {}
}
