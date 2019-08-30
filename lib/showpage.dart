
import 'package:flutter/material.dart';
import 'package:flutter_test1/popup_window.dart';

class ShowPage extends StatefulWidget {
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("弹出框title"),
      ),
      body: Container(
        child: InkWell(
          onTap: (){
            _showSortMenu();
          },
          child: Column(
            children: <Widget>[
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
              Text("oaifaiojfoiajfioafjia"),
            ],
          ),
        ),
      ),
    );
  }


  _showSortMenu() {
    // 获取点击控件的坐标

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(Offset(0,0), Offset(0,0)),
      Rect.fromPoints(Offset(0,0), Offset(0,0)),
    );
    showPopupWindow(
      context: context,
      fullWidth: true,
      position: position,
      elevation: 0.0,
      child: GestureDetector(
        onTap: () {
//          NavigatorUtil.goBack(context);
          Navigator.pop(context);
        print(1234);
        },
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.all(0),
          height: 800,
          child:  Scaffold(
            backgroundColor: Colors.deepOrangeAccent,
            appBar: AppBar(
              title: Text("弹出的框 "),
            ),
            body: Container(
              height: 200,
              color: Colors.blue,

              child: InkWell(
                onTap: (){
                  _showSortMenu();
                },
                child: Text("按钮"),
              ),
            ),
          ),
          ),
        ),
      );
  }
}
