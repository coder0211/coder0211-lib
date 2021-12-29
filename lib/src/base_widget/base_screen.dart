import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  @override
  void initState() {
    super.initState();
    print('\≈≈≈≈≈≈≈≈≈≈≈≈ Current screen ≈≈≈≈≈≈≈≈≈≈≈≈> ' +
        this
            .runtimeType
            .toString()
            .replaceFirst('State', '')
            .replaceAll('_', '') +
        '\n');
  }
}
