<p align="center">
  <a href="https://github.com/coder0211/coder0211"><img src="https://raw.githubusercontent.com/coder0211/coder0211/main/lib/logo/logo.svg" width="200" alt="Coder0211-logo"></a>
</p>
<p align="center">
  <a href="https://pub.dev/packages/coder0211/score" target="_blank"><img src="https://img.shields.io/badge/PUB%20POINTS-130%2F130-green" alt="pub points" /></a>
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
     Widget build(BuildContext context) {
       super.build(context);
       return Scaffold(
         appBar: AppBar(),
         body: Container()
      );
    }
 }
```

## 2. BaseAPI

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

## 3. BaseSharedPreferences

### [BaseSharedPreferences] is a base class for all shared preferences

```dart
    String value = '';
    if(await BaseSharedPreferences.containKey('KEY')){
        value = await BaseSharedPreferences.getStringValue('KEY');
    }

```

## 4. BaseNavigation

### [push] Push a route to the navigator

- Param [context] The context to push the route to
- Param [routeName] The routeName to push
- Param [clearStack] Clear the stack before pushing the
- Example:

```dart
BaseNavigation.push(context, routeName: '/', clearStack: true);
```

### [getArgs] Get the arguments from the current route

- Param [context] The context to get the arguments
- Param [key] The key to get the arguments
- Example:

```dart
BaseNavigation.getArgs(context, key: 'id');
```

## 5. TextEX

- USING : `<String>.<Name()>`
- Example:

```dart
'Hello'.d1()
hoặc
S.current.splash_screen_title.d1(color: AppColors.whiteText)
```

## 6. DoubleEX

- USING : `<Double>.<Name()>`
- Example:

```dart
10.0.r(context)
```
