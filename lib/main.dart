import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test1/show/showpage2.dart';
import 'package:flutter_test1/showpage.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'MyScaffold.dart';
import 'exple.dart';
import 'jianpan.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String hintText;
  bool status = false;

  ScrollController _controller = new ScrollController();

  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scrollController: _controller,
      backTop: true,
      appBar: AppBar(
        title: Text("Keyboard Actions Sample"),
      ),
      body: Showpage2(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
