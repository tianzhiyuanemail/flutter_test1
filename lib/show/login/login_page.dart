import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test1/res/resources.dart';
import 'package:flutter_test1/util/my_button.dart';
import 'package:flutter_test1/util/text_field.dart';
import 'package:flutter_test1/util/utils.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../MyScaffold.dart';
import '../full_screen_dialog_util.dart';
import '../showpage1.dart';

/// 用户登录
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  KeyboardActionsConfig _config;
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    _config = Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2]);
  }

  void _verify() {
  }

  void _login() {
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: defaultTargetPlatform == TargetPlatform.iOS
            ? FormKeyboardActions(
                child: _buildBody(),
              )
            : SingleChildScrollView(
                child: _buildBody(),
              ));
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(left:0, right: 0, top: 0.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 300,
            width: 450,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
                fit: BoxFit.fill
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: InkWell(
              onTap: pop,
              child: Image.asset("assets/image/alipay.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Gaps.vGap50,
                Gaps.vGap50,
                Gaps.vGap50,
                Gaps.vGap50,
                Gaps.vGap50,
                Gaps.vGap50,
                MyTextField(
                  config: _config,
                  focusNode: _nodeText1,
                  controller: _nameController,
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  hintText: "请输入手机号码",
                ),
                Gaps.vGap50,
                MyButton(
                  onPressed: _isClick ? _login : null,
                  text: "下一步",
                ),
                Gaps.vGap16,
                Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Text(
                        '还没账号？快去注册',
                        style: TextStyle(color: Colours.text_blue),
                      ),
                      onTap: () {
//                  NavigatorUtil.push(context, Routers.registerPage);
                      },
                    ))
              ],
            ),
          )
        ],
      )
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
