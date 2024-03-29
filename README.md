<p align="center">
  <a href="https://github.com/coder0211/coder0211"><img src="https://raw.githubusercontent.com/coder0211/coder0211-lib/main/lib/logo/logo.svg" width="200" alt="Coder0211-logo"></a>
</p>
<p align="center">
  <a href="https://pub.dev/packages/coder0211/score" target="_blank"><img src="https://img.shields.io/badge/PUB%20POINTS-140%2F140-green" alt="pub points" /></a>
  <a href="https://pub.dev/packages/coder0211/score" target="_blank"><img src="https://img.shields.io/badge/Coder0211-likes%3A22-yellow" alt="coder0211-like" /></a>
  <a href="https://pub.dev/packages/coder0211/license" target="_blank"><img src="https://img.shields.io/badge/LICENSE-MIT-blue" alt="Package License" /></a>  
</p>

# Coder0211

This is a package with functions and widgets to make app development faster and more convenient, currently it is developed by one developer.

# Support

## 1. Base screen

### [BaseScreen] is a base class for all screens in the app.

- It provides some useful methods for screens.
- Every screen should extend this class.
- Example:

```dart
class MyHomePage extends BaseScreen {
     const MyHomePage({Key? key}) : super(key: key);
     @override
     State<MyHomePage> createState() => _MyHomePageState();
}
```

### [BaseScreenState] is a base class for all screen states in the app.

- It provides the [store].
- AutomaticKeepAliveClientMixin is used to keep the screen alive when the user
  navigates to another screen.
- It also provides the [initState] method to initialize the [store] instance.
- It also provides the [build] method to build the screen.
- Every screen state should extend this class.
- [BaseScreenState] is a stateful widget.
- Example:

```dart
class _MyHomePageState extends BaseScreenState<MyHomePage, MainStore> {
  @override
  Widget buildLargeScreen(BuildContext context) {
    // TODO: implement buildLarge
    throw UnimplementedError();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    // TODO: implement buildMedium
    throw UnimplementedError();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    // TODO: implement buildSmall
    throw UnimplementedError();
  }
}
```

## 2. Store

### State managements

```dart
/// Clean before updating:
///    flutter packages pub run build_runner watch --delete-conflicting-outputs

part 'example_store.g.dart';

class ExampleStore = _ExampleStore with _$ExampleStore;

abstract class _ExampleStore with Store, BaseStoreMixin {
  @override
  void onInit(BuildContext context) {}

  @override
  void onDispose() {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  //... Some values and actions
}
```

## 3. BaseAPI

### [BaseDataAPI] - Base Class for handling API

### [fetchData] is fetch data from API

- Param [url] is url of API without domain
- Param [params] is params of API with key and value
- Param [body] is body of API with key and value
- Param [headers] is headers of API with key and value
- Return [BaseDataAPI] is object of BaseDataAPI with object and apiStatus

```dart
 return BaseDataAPI(object: response.data, apiStatus:ApiStatus.SUCCEEDED);
```

- Example:

```dart
@action
  Future<void> getData() async {
    BaseAPI _api = BaseAPI();
    BaseAPI.domain = 'https://example.com';
    await _api.fetchData('/data', method: ApiMethod.GET).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          printLogSusscess('SUCCEEDED');
          // Handle success response here
          break;
        case ApiStatus.INTERNET_UNAVAILABLE:
          printLogYellow('INTERNET_UNAVAILABLE');
          BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
          break;
        default:
          printLogError('FAILED');
          // Handle failed response here
          break;
      }
    });
  }
```

## 4. BaseSharedPreferences

### [BaseSharedPreferences] is a base class for all shared preferences

```dart
    String value = '';
    if(await BaseSharedPreferences.containKey('KEY')){
        value = await BaseSharedPreferences.getStringValue('KEY');
    }

```

## 5. BaseNavigation

### [push] Push a route to the navigator

- Param [context] The context to push the route to
- Param [routeName] The routeName to push
- Param [clearStack] Clear the stack before pushing the
- Example:

```dart
BaseNavigation.push(context, routeName: '/', clearStack: true);
//or
BaseNavigation.push(context, routeName: '/', clearStack: true, {'id' : 12345});
```

### [getArgs] Get the arguments from the current route

- Param [context] The context to get the arguments
- Param [key] The key to get the arguments
- Example:

```dart
BaseNavigation.getArgs(context, key: 'id');
```

## 6. TextEX

- USING : `<String>.<Name()>`
- Example:

```dart
'Hello'.d1()
hoặc
S.current.splash_screen_title.d1(color: AppColors.whiteText)
```

## 7. DoubleEX

- USING : `<Double>.<Name()>`
- Example:

```dart
10.0.r(context)
```
