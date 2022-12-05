import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/router/app_navigator.dart';
import 'package:flutter_demo/res/font/font.dart';

import 'test_logic.dart';

final logic = Get.find<TestLogic>();

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "请输入单行文本",
                border: const OutlineInputBorder(),
                prefixIcon: Icon(
                  MyIcons.add,
                ),
                prefixIconColor: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AppNavigator.toHome();
              },
              child: const Text('123'),
            ),
          ],
        ),
      ),
    );
  }
}
