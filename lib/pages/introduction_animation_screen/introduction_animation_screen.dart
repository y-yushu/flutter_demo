import 'package:flutter/material.dart';

/// 类似欢迎页
///
/// 2022/12/8 yyshu
class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({super.key});

  @override
  State<IntroductionAnimationScreen> createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("欢迎页"),
      ),
    );
  }
}
