import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen, S extends Store>
    extends State<T> with AutomaticKeepAliveClientMixin<T>, BaseScreenMixin<S> {
  @override
  void initState() {
    super.initState();
    store = context.read<S>();
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

mixin BaseScreenMixin<T> {
  late T store;
}
