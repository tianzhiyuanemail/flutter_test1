import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 封装
/// 1 点击空白 收起键盘
/// 2 返回顶部
/// 3 appbar 高度
/// 4

class MyScaffold extends StatefulWidget {
  /// Creates a visual scaffold for material design widgets.
  const MyScaffold({
    Key key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.scrollController,
    this.backTop = false,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
  })  : assert(primary != null),
        assert(extendBody != null),
        assert(drawerDragStartBehavior != null),
        super(key: key);

  final bool extendBody;

  final PreferredSizeWidget appBar;

  final Widget body;

  final Widget floatingActionButton;

  final FloatingActionButtonLocation floatingActionButtonLocation;

  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  final List<Widget> persistentFooterButtons;

  final Widget drawer;

  final Widget endDrawer;

  final Color backgroundColor;

  final Widget bottomNavigationBar;

  final Widget bottomSheet;

  final bool resizeToAvoidBottomPadding;

  final bool resizeToAvoidBottomInset;

  final bool primary;

  /// 返回顶部 必须传此二参数
  final ScrollController scrollController;
  final bool backTop;

  final DragStartBehavior drawerDragStartBehavior;

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyScaffold> {

  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();

//    /// 导航栏监听
//    widget.scrollController.addListener(() {
//      if (widget.backTop){
//        ///是否显示“返回到顶部”按钮
//        if (widget.scrollController.offset < 1000 && showToTopBtn) {
//          setState(() {
//            showToTopBtn = false;
//          });
//        } else if (widget.scrollController.offset >= 1000 && showToTopBtn == false) {
//          setState(() {
//            showToTopBtn = true;
//          });
//        }
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: widget.key,
        appBar: widget.appBar,
        body: Stack(
          children: <Widget>[
            widget.body,
            Positioned(
              bottom: 80,
              right: 20,
              child: BackTopButton(
                  controller: widget.scrollController, showToTopBtn: showToTopBtn),
            ),
          ],
        ),
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        persistentFooterButtons: widget.persistentFooterButtons,
        drawer: widget.drawer,
        endDrawer: widget.endDrawer,
        bottomNavigationBar: widget.bottomNavigationBar,
        bottomSheet: widget.bottomSheet,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        drawerDragStartBehavior: widget.drawerDragStartBehavior,
        extendBody: widget.extendBody,
      ),
    );
  }
}

class BackTopButton extends StatelessWidget {
  ScrollController controller;

  bool showToTopBtn; //是否显示“返回到顶部”按钮

  BackTopButton({Key key, this.controller, this.showToTopBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !showToTopBtn,
      child: FloatingActionButton(
          heroTag: null,

          /// 解决错误 There are multiple heroes that share the same tag within a subtree.
          backgroundColor: Colors.pink.withOpacity(0.7),
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
            size: 20,
          ),
          tooltip: "按这么长时间干嘛",
          mini: true,
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: () {
            //返回到顶部时执行动画
            controller.animateTo(.0,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          }),
    );
  }
}
