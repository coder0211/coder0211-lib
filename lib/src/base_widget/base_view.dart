import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/src/provider.dart';

abstract class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<T extends Store> extends State<BaseView<T>> {
  T? state;

  @override
  initState() {
    super.initState();
    state = context.read<T>();
    codeInitState();
  }

  @override
  dispose() {
    super.dispose();
    codeDisposeState();
  }

  void codeInitState() {}

  void codeDisposeState() {}
}
