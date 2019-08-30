import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example> {
  EasyRefreshController _controller;

  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EasyRefresh"),
        ),
        body: EasyRefresh.custom(
          header: ClassicalHeader(
            enableInfiniteRefresh: false,
            refreshText: '下拉刷新',
            refreshReadyText: '释放刷新',
            refreshingText: '正在刷新',
            refreshedText: '刷新完成',
            refreshFailedText: '刷新失败',
            noMoreText: '没有更多',
            textColor: Colors.red,
            infoText: '更新于 10:10',
            bgColor: Colors.white,
            infoColor: Colors.red,
            float: false,
            enableHapticFeedback: true,
          ),
          footer: ClassicalFooter(
            enableInfiniteLoad: true,
            loadText: '上拉加载',
            loadReadyText: '释放加载',
            loadingText: '加载中',
            loadedText: '加载完成',
            loadFailedText: '加载失败',
            noMoreText: '已经到底了哦',
            infoText: '更新于 10:10',
            textColor: Colors.red,
            bgColor: Colors.white,
            infoColor: Colors.red,
            enableHapticFeedback: true,
            triggerDistance: 100.0,
          ),
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          firstRefresh: true,
          controller: _controller,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('onRefresh');
              setState(() {
                _count = 20;
              });
              _controller.resetLoadState();
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              print('onLoad');
              setState(() {
                _count += 10;
              });
              _controller.finishLoad(noMore: _count >= 40);
            });
          },
          emptyWidget: _count == 0 ? Container(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: SizedBox(), flex: 2,),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/image/nodata.png'),
                ),

                Expanded(child: SizedBox(), flex: 3,),
              ],
            ),
          ): null,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    width: 60.0,
                    height: 60.0,
                    child: Center(
                      child: Text('$index'),
                    ),
                    color:
                        index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                  );
                },
                childCount: _count,
              ),
            ),
          ],
        ) );
  }
}
