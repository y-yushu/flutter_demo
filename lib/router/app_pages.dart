import 'package:get/get.dart';
import 'package:flutter_demo/pages/home/home_binding.dart';
import 'package:flutter_demo/pages/home/home_view.dart';
import 'package:flutter_demo/pages/test/test_binding.dart';
import 'package:flutter_demo/pages/test/test_view.dart';
import 'package:flutter_demo/pages/introduction_animation_screen/introduction_animation_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    // 首页
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    // 欢迎页
    GetPage(
      name: AppRoutes.IntroductionAnimationScreen,
      page: () => const IntroductionAnimationScreen(),
    ),
    GetPage(
      name: AppRoutes.TEST,
      page: () => const TestPage(),
      binding: TestBinding(),
    ),
  ];
}
