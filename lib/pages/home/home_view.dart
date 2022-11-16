import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_demo/res/font/font.dart';
import 'package:flutter_demo/rewrite/FloatingButtonCustomLocation.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("GetX Navigation"),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('点击111');
        },
        // child: Icon(
        //   MyIcons.add,
        // ),
      ),
      floatingActionButtonLocation: _fabl,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: const Text('123'),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              child: const Text('123'),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.yellowAccent,
              ),
              child: const Text('123'),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: const Text('123'),
            ),
          ],
        ),
      ),
    );
  }
}
