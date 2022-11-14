import 'package:get/get.dart';
import 'package:flutter_demo/pages/home/home_binding.dart';
import 'package:flutter_demo/pages/home/home_view.dart';
// import 'package:flutter_demo/pages/test/test_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
