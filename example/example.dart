import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'example_store.g.dart';

void main() {
  runApp(const MyApp());
}

/// Clean before updating:
///    flutter packages pub run build_runner watch --delete-conflicting-outputs
class ExampleStore = _ExampleStore with _$ExampleStore;

abstract class _ExampleStore with Store {
  @observable
  int _ic = 0;

  int get ic => _ic;

  set ic(int ic) {
    _ic = ic;
  }

  List<int> lists = [];

  @observable
  ObservableList<int> listsInt = ObservableList<int>();

  @action
  void ice() {
    ic++;
  }

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
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<ExampleStore>(create: (context) => ExampleStore())],
      child: const MaterialApp(
        home: Example(),
      ),
    );
  }
}

class Example extends BaseScreen {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends BaseScreenState<Example, ExampleStore> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 1.0.w(context),
            ),
            Observer(builder: (_) {
              return Text(
                '${store.ic}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            'Hello'.d1()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.ice();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
