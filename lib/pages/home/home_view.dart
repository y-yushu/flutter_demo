import 'package:flutter_demo/res/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/homelist.dart';

/// 首页
///
/// 2022/12/8 yyshu
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? animationController;
  bool multiple = true; // 首页布局状态 宫格或列表
  List<HomeList> homeList = HomeList.homelist; // 所有页面

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1000),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // 判断当前是否黑夜模式
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          isLightMode == true ? AppTheme.white : AppTheme.nearlyBlack,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // AppBar
                  appBar(isLightMode),
                  body(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // AppBar
  Widget appBar(bool isLightMode) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
            ),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  'Flutter UI',
                  style: TextStyle(
                    fontSize: 22,
                    color: isLightMode ? AppTheme.darkText : AppTheme.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
            ),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: isLightMode ? Colors.white : AppTheme.nearlyBlack,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  onTap: () {
                    setState(() => multiple = !multiple);
                  },
                  child: Icon(
                    multiple ? Icons.view_agenda : Icons.dashboard,
                    color: isLightMode ? AppTheme.darkGrey : AppTheme.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Body
  Widget body() {
    return Expanded(
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              padding: const EdgeInsets.only(
                top: 0,
                left: 12,
                right: 12,
              ),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: multiple ? 2 : 1,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              children: List<Widget>.generate(
                homeList.length,
                (int index) {
                  final int count = homeList.length;
                  final Animation<double> animation = Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval(
                        (1 / count) * index,
                        1,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  );
                  animationController?.forward();
                  return HomeListView(
                    animation: animation,
                    animationController: animationController,
                    listData: homeList[index],
                  );
                  // return SizedBox();
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  // 构造函数
  const HomeListView({
    Key? key,
    this.listData,
    this.animationController,
    this.animation,
  }) : super(key: key);

  // 数据
  final HomeList? listData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform:
                Matrix4.translationValues(0, 50 * (1 - animation!.value), 0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        onTap: listData!.callback,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
