part of 'app_pages.dart';

abstract class AppRoutes {
  static const HOME = '/home';
  static const TEST = '/test';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
