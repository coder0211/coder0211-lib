import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with AutomaticKeepAliveClientMixin<T> {

  @override
  void initState() {
    super.initState();
    printLogBlue('\≈≈≈≈≈≈≈≈≈≈≈≈ Current screen ≈≈≈≈≈≈≈≈≈≈≈≈> ' +
        this
            .runtimeType
            .toString()
            .replaceFirst('State', '')
            .replaceAll('_', ''));
  }

  void printLogBlue(String message) {
    print('\x1B[34m$message\x1B[0m');
  }

  @override
  bool get wantKeepAlive => true;
}
