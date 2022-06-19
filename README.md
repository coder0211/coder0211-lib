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
- It also provides the [dispose] method to dispose the [store] instance.
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

## 2. TextEX

- USING : `<String>.<Name()>`
- > Example: `hello.d1()`

### [d1] return text with style d1

- Param [color] color = Colors.black
- Param [textAlign] textAlign = TextAlign.start
- Param [maxLines] maxLines = 1
- Param [fontSize] font size = 42
- Param [fontWeight] font weight = FontWeight.w300

```dart
  Widget d1(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 42, color: color, fontWeight: FontWeight.w300));
  }
```

## 3. DoubleEX

- USING : `<Double>.<Name()>`
- > Example: `10.0.r(context)`

### [r(context)] Get the standard ratio compared to the design screen size

```dart
  double r(BuildContext context, {double defaultScreenWidth = 390}) =>
      (this / defaultScreenWidth) * BaseUtils.getScreenWidth(context);
```
