import 'dart:ui';
import 'package:flutter_demo/router/app_navigator.dart';

class HomeList {
  // 构造函数
  HomeList({
    this.imagePath = '',
    this.callback,
  });
  // 属性
  String imagePath;
  VoidCallback? callback;

  // mock数据
  static List<HomeList> homelist = <HomeList>[
    HomeList(
      imagePath: 'lib/assets/images/introduction_animation.png',
      callback: () {
        AppNavigator.toIntroductionAnimationScreen();
      },
    ),
    HomeList(
      imagePath: 'lib/assets/images/hotel_booking.png',
      callback: () {
        print('点击二');
      },
    ),
    HomeList(
      imagePath: 'lib/assets/images/fitness_app.png',
      callback: () {
        print('点击三');
      },
    ),
    HomeList(
      imagePath: 'lib/assets/images/design_course.png',
      callback: () {
        print('点击四');
      },
    ),
  ];
}
