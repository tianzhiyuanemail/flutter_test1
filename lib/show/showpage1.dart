import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../MyScaffold.dart';
import '../util.dart';
import 'full_screen_dialog_util.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
//  final FocusNode _nodeText1 = FocusNode();
//
//  @override
//  void initState() {
//    Util.setKeyboardActions(context,[_nodeText1]);
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 20,
                left: 20,
                child: InkWell(
                  onTap: pop,
                  child: Image.asset("assets/image/alipay.png"),
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                bottom: 300,
                right: 20,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text("手机号快速登录"),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("登录代表您已经阅读并同意"),
                            Text("<<返利隐私协议政策>>")
                          ],
                        ),
                      ),
                      Container(
//                        child: Text("+86 请输入手机号"),
                        child: Row(
                          children: <Widget>[
                            Text("+86 请输入手机号"),
//                            SingleChildScrollView(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.stretch,
//                                children: <Widget>[
//                                  TextField(
//                                    keyboardType: TextInputType.text,
//                                    focusNode: _nodeText1,
//                                    decoration: InputDecoration(
//                                      hintText: "Input Number",
//                                    ),
//                                  ),
//
//                                ],
//                              ),
//                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text("获取验证码"),
                      ),
                      Container(
                        child: Text("未注册的手机号码验证后自动注册"),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 180,
                right: 20,
                child: RaisedButton(
                  onPressed: _openAddEntryDialog,
                  child: Text("前进"),
                ),
              ),
              Positioned(
                bottom: 180,
                right: 120,
                child: RaisedButton(
                  onPressed: pop,
                  child: Text("后退"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAddEntryDialog() {
    FullScreenDialogUtil.openFullDialog(context, AddEntryDialog(),
        replace: true);
  }

  void pop() {
    FullScreenDialogUtil.closeFullDialog(context);
  }
}
