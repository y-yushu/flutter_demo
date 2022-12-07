import 'package:flutter_demo/pages/home/home_logic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/res/font/font.dart';
import 'package:flutter_demo/rewrite/FloatingButtonCustomLocation.dart';

final logic = Get.find<HomeLogic>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  FloatingActionButtonLocation _fabl = FloatingActionButtonLocation.centerFloat;

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _fabl = FloatingButtonCustomLocation(
            FloatingActionButtonLocation.centerFloat,
            offsetY: 100,
          );
        });
      } else {
        setState(() {
          _fabl = FloatingActionButtonLocation.centerFloat;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: logic.onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter UI"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: logic.clickFloatingActionButton,
          child: Icon(
            MyIcons.add,
          ),
        ),
        floatingActionButtonLocation: _fabl,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 2,
            children: _GridChildren(),
          ),
          // child: GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 0.0,
          //     crossAxisSpacing: 0.0,
          //     childAspectRatio: 1.0,
          //   ),
          //   itemCount: 10,
          //   itemBuilder: (item, index) {
          //     return Container(
          //       child: const Text('data'),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }

  // 宫格
  List<Widget> _GridChildren() {
    return [
      Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('111'),
      ),
      Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('222'),
      ),
      Text('123'),
      Text('123'),
      Text('123'),
      Text('123'),
      Text('123'),
    ];
  }
}
