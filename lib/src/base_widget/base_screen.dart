import 'package:flutter/material.dart';

import '../../coder0211.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  bool _isConnected = false;
  bool isLoadDataSucceeded = false;
  @override
  void initState() {
    super.initState();
    print('\≈≈≈≈≈≈≈≈≈≈≈≈ Current screen ≈≈≈≈≈≈≈≈≈≈≈≈> ' +
        this.runtimeType.toString().replaceFirst('State', '') +
        '\n');
    BaseUtils.onWidgetBuildDone(_checkInit);
  }

  Widget frame() {
    return BaseViewLoading(
      isLoading: !_isConnected || !isLoadDataSucceeded,
      child: SafeArea(bottom: false, child: body()),
    );
  }

  Widget body();

  Future<void> _checkInit() async {
    _isConnected = await BaseUtils.checkConnection();
    setState(() {});
  }
}
