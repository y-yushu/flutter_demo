import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/res/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/res/lang/lang.dart'; // 国际化
import 'package:flutter_demo/router/app_pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 顶部状态栏，底部操作栏 设为透明
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      title: 'Best UI',
      debugShowCheckedModeBanner: false, // 隐藏‘DEBUG’标签
      // 主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS, // ios主题风格 （标题居中，右划子页面等）
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
