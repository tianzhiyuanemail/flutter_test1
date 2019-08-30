import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_i18n/flutter_i18n.dart';


/// 基本示例(经典样式)页面
class BasicPage extends StatefulWidget {
  /// 标题
  final String title;

  const BasicPage(this.title, {Key key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}
class _BasicPageState extends State<BasicPage> {
  EasyRefreshController _controller;
  ScrollController _scrollController;

  // 条目总数
  int _count = 20;
  // 反向
  bool _reverse = false;
  // 方向
  Axis _direction = Axis.vertical;
  // Header浮动
  bool _headerFloat = false;
  // 无限加载
  bool _enableInfiniteLoad = true;
  // 控制结束
  bool _enableControlFinish = false;
  // 任务独立
  bool _taskIndependence = false;
  // 震动
  bool _vibration = true;
  // 是否开启刷新
  bool _enableRefresh = true;
  // 是否开启加载
  bool _enableLoad = true;
  // 顶部回弹
  bool _topBouncing = true;
  // 底部回弹
  bool _bottomBouncing = true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,

      ),
      body: Center(
        child: Container(
          height: _direction == Axis.vertical ? double.infinity : 210.0,
          child: EasyRefresh.custom(
//            enableControlFinishRefresh: true,
//            enableControlFinishLoad: true,
//            taskIndependence: _taskIndependence,
//            controller: _controller,
//            scrollController: _scrollController,
//            reverse: _reverse,
//            scrollDirection: _direction,
//            topBouncing: _topBouncing,
//            bottomBouncing: _bottomBouncing,
            header: ClassicalHeader(
              enableInfiniteRefresh: false,
              refreshText: FlutterI18n.translate(context, 'pullToRefresh'),
              refreshReadyText: FlutterI18n.translate(context, 'releaseToRefresh'),
              refreshingText: FlutterI18n.translate(context, 'refreshing'),
              refreshedText: FlutterI18n.translate(context, 'refreshed'),
              refreshFailedText: FlutterI18n.translate(context, 'refreshFailed'),
              noMoreText: FlutterI18n.translate(context, 'noMore'),
              infoText: FlutterI18n.translate(context, 'updateAt'),
              bgColor: _headerFloat ? Theme.of(context).primaryColor : null,
              infoColor: _headerFloat ? Colors.black87 : Colors.teal,
              float: _headerFloat,
              enableHapticFeedback: _vibration,
            ),
            footer: ClassicalFooter(
              enableInfiniteLoad: _enableInfiniteLoad,
              loadText: FlutterI18n.translate(context, 'pushToLoad'),
              loadReadyText: FlutterI18n.translate(context, 'releaseToLoad'),
              loadingText: FlutterI18n.translate(context, 'loading'),
              loadedText: FlutterI18n.translate(context, 'loaded'),
              loadFailedText: FlutterI18n.translate(context, 'loadFailed'),
              noMoreText: FlutterI18n.translate(context, 'noMore'),
              infoText: FlutterI18n.translate(context, 'updateAt'),
              enableHapticFeedback: _vibration,
            ),
            onRefresh: _enableRefresh ? () async {
              await Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  _count = 20;
                });
                if (!_enableControlFinish) {
                  _controller.resetLoadState();
                  _controller.finishRefresh();
                }
              });
            }: null,
            onLoad: _enableLoad ? () async {
              await Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  _count += 20;
                });
                if (!_enableControlFinish) {
                  _controller.finishLoad(noMore: _count >= 80);
                }
              });
            }: null,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return Text("1");
                  },
                  childCount: _count,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}