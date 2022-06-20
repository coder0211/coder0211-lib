import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

/// # [BaseScreen] is a base class for all screens in the app.
/// * It provides some useful methods for screens.
/// * Every screen should extend this class.
/// * Example:
///```dart
///class MyHomePage extends BaseScreen {
///     const MyHomePage({Key? key}) : super(key: key);
///     @override
///     State<MyHomePage> createState() => _MyHomePageState();
///}
///```
abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

/// # [BaseScreenState] is a base class for all screen states in the app.
/// * It provides the [store].
/// * AutomaticKeepAliveClientMixin is used to keep the screen alive when
/// the user navigates to another screen.
/// * It also provides the [initState] method to initialize
/// the [store] instance.
/// * It also provides the [dispose] method to dispose the [store] instance.
/// * It also provides the [build] method to build the screen.
/// * Every screen state should extend this class.
/// * [BaseScreenState] is a stateful widget.
/// * Example:
///```dart
///class _MyHomePageState extends BaseScreenState<MyHomePage, MainStore> {
///     @override
///     Widget build(BuildContext context) {
///       super.build(context);
///       return Scaffold(
///         appBar: AppBar(),
///         body: Container()
///      );
///    }
/// }
/// ```
abstract class BaseScreenState<T extends BaseScreen, S extends Store>
    extends State<T> with AutomaticKeepAliveClientMixin<T>, BaseScreenMixin<S> {
  @override
  void initState() {
    super.initState();

    ///Initialize the [store] instance.
    store = context.read<S>();
    printLogBlue('\≈≈≈≈≈≈≈≈≈≈≈≈ Current screen ≈≈≈≈≈≈≈≈≈≈≈≈> ' +
        this
            .runtimeType
            .toString()
            .replaceFirst('State', '')
            .replaceAll('_', ''));
  }

  ///printLogBlue is a method to print logs in blue.
  void printLogBlue(String message) {
    print('\x1B[34m$message\x1B[0m');
  }

  ///[wantKeepAlive] is a flag to keep the screen alive.
  @override
  bool get wantKeepAlive => true;
}

///[BaseScreenMixin] is a base class for all screen mixins in the app.
///It provides the [store].
mixin BaseScreenMixin<T> {
  late T store;
}
