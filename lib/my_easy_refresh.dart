
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MyEasyRefresh extends StatefulWidget {
  EasyRefreshController easyRefreshController;

  Function onRefresh;
  Function onLoad;
  Widget child;


  MyEasyRefresh({Key key,this.easyRefreshController, this.onRefresh, this.onLoad,
    this.child});

  @override
  _MyEasyRefreshState createState() => _MyEasyRefreshState();
}

class _MyEasyRefreshState extends State<MyEasyRefresh> {

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
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
      controller: widget.easyRefreshController,
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
//      emptyWidget: _count == 0 ? Container(
//        height: double.infinity,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Expanded(child: SizedBox(), flex: 2,),
//            SizedBox(
//              width: 100.0,
//              height: 100.0,
//              child: Image.asset('assets/image/nodata.png'),
//            ),
//
//            Expanded(child: SizedBox(), flex: 3,),
//          ],
//        ),
//      ): null,
      child: widget.child,
    ) ;
  }
}
