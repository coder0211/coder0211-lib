import 'package:coder0211/coder0211.dart';
import 'package:coder0211/src/constants.dart';
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
abstract class BaseScreenState<T extends BaseScreen, S extends BaseStoreMixin>
    extends State<T> with AutomaticKeepAliveClientMixin<T>, BaseScreenMixin<S> {
  @override
  void initState() {
    super.initState();

    ///Initialize the [store] instance.
    store = context.read<S>();

    store.onInit(context);

    BaseUtils.onWidgetBuildDone(store.onWidgetBuildDone, context);

    ///Print log when the screen is created.
    printLogBlue('\≈≈≈≈≈≈≈≈≈≈≈≈ Current screen ≈≈≈≈≈≈≈≈≈≈≈≈> ' +
        this
            .runtimeType
            .toString()
            .replaceFirst('State', '')
            .replaceAll('_', ''));
  }

  @override
  void dispose() {
    /// When this screen on dispose then store call onDispose function
    store.onDispose(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _baseBuild(context);
  }

  ///Build small using for mobile devices
  @protected
  Widget buildSmallScreen(BuildContext context);

  ///Build medium using for tablet devices
  @protected
  Widget buildMediumScreen(BuildContext context) {
    return 'Medium Screen'.t1M();
  }

  ///Build large using for tablet devices
  @protected
  Widget buildLargeScreen(BuildContext context) {
    return 'Large Screen'.t1M();
  }

  Widget _baseBuild(BuildContext context) {
    if (1.0.w(context) < Constants.SMALL) {
      return buildSmallScreen(context);
    } else if (1.0.w(context) < Constants.MEDIUM) {
      return buildMediumScreen(context);
    } else {
      return buildLargeScreen(context);
    }
  }

  ///printLogBlue is a method to print logs in blue.
  @protected
  void printLogBlue(String message) {
    print('\x1B[34m$message\x1B[0m');
  }

  ///[wantKeepAlive] is a flag to keep the screen alive.
  @override
  bool get wantKeepAlive => true;
}

///[BaseScreenMixin] is a base class for all screen mixins in the app.
///It provides the [store].
mixin BaseScreenMixin<T extends BaseStoreMixin> {
  late T store;
}

mixin BaseStoreMixin on Store {
  @protected
  @mustCallSuper

  ///onInit called when initState called
  void onInit(BuildContext context);

  @protected
  @mustCallSuper

  ///onWidgetBuildDone called when build done widget
  Future<void> onWidgetBuildDone(BuildContext context);

  @protected
  @mustCallSuper

  ///onDispose called when dispose
  void onDispose(BuildContext context);

  @protected
  @mustCallSuper
  void resetValue();
}
