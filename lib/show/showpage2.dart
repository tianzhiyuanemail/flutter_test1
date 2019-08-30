import 'package:flutter/material.dart';
import 'package:flutter_test1/show/showpage1.dart';

import 'full_screen_dialog_util.dart';
import 'login/login_page.dart';

class Showpage2 extends StatefulWidget {
  @override
  _Showpage2State createState() => _Showpage2State();
}

class _Showpage2State extends State<Showpage2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("全局弹框"),
      ),
      body: Container(
        color: Colors.red,
        child: FlatButton(onPressed: _openAddEntryDialog, child: Text("点击弹框")),
      ),
    );
  }


  void _openAddEntryDialog() {
    FullScreenDialogUtil.openFullDialog(context, LoginPage());
  }
}
