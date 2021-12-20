import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../coder0211.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState extends State<BaseScreen> {
  bool _isConnected = false;
  bool isLoadDataSucceeded = false;
  PreferredSizeWidget? appBar;
  Color? backgroundColor, drawerScrimColor;
  Widget? bottomNavigationBar,
      bottomSheet,
      drawer,
      endDrawer,
      floatingActionButton;
  DragStartBehavior? drawerDragStartBehavior;
  double? drawerEdgeDragWidth;
  bool? drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture,
      extendBody,
      extendBodyBehindAppBar,
      primary,
      resizeToAvoidBottomInset;
  FloatingActionButtonAnimator? floatingActionButtonAnimator;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  Function(bool)? onDrawerChanged, onEndDrawerChanged;
  List<Widget>? persistentFooterButtons;
  String? restorationId;
  @override
  void initState() {
    super.initState();
    BaseUtils.onWidgetBuildDone(_checkInit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      drawerDragStartBehavior:
          drawerDragStartBehavior ?? DragStartBehavior.start,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
      drawerScrimColor: drawerScrimColor,
      endDrawer: endDrawer,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture ?? true,
      extendBody: extendBody ?? false,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      persistentFooterButtons: persistentFooterButtons,
      primary: primary ?? true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      restorationId: restorationId,
      body: SafeArea(
        child: BaseViewLoading(
          isLoading: !_isConnected || !isLoadDataSucceeded,
          child: body(),
        ),
      ),
    );
  }

  Widget body();

  Future<void> _checkInit() async {
    _isConnected = await BaseUtils.checkConnection();
    setState(() {});
  }
}
