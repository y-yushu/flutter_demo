import 'package:flutter/material.dart';

// 1.继承 FloatingActionButtonLocation
// 2.增加 offsetX、offsetY 两个变量
// 3.重写getOffset 并通过父类”FloatingActionButtonLocation“ 调用 Offset offset = location.getOffset(scaffoldGeometry);获取到设置完location 之后的位置对其进行修改
class FloatingButtonCustomLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  final double offsetX; // X方向的偏移量
  final double offsetY; // Y方向的偏移量
  FloatingButtonCustomLocation(this.location,
      {this.offsetX = 0, this.offsetY = 0});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

// 调用方法
// FloatingButtonCustomLocation(
//           FloatingActionButtonLocation.centerDocked,
//           offsetY: Platform.isIOS && padding.bottom > 0 ? 15 :  -10,
//           offsetX: 0 
//       )
// 注:offsetY或offsetX 可选参数 默认 = 0
