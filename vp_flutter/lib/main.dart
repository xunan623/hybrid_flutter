import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'first': (pageName, params, _) => FirstDemo(),
      'vpdemo://flutter/first': (pageName, params, _) => FirstDemo(),
      'vpdemo://flutter/second': (pageName, params, _) => SecondDemo(),
      'vpdemo://flutter/third': (pageName, params, _) => SecondDemo(),
      'second': (pageName, params, _) => SecondDemo(),
      'list': (pageName, params, _) => ListDemo(),
      'third': (pageName, params, _) => ThirdDemo(),
      'flutterPage': (pageName, params, _) {
        print('flutterPage params:$params');

        return FlutterRouteDemo(params: params);
      }
    });
    FlutterBoost.singleton
        .addBoostNavigatorObserver(BoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      routes: {
        '/first': (BuildContext context) => FirstDemo(),
        '/second': (BuildContext context) => SecondDemo(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}

class ThirdDemo extends StatefulWidget {
  @override
  _ThirdDemoState createState() => _ThirdDemoState();
}

class _ThirdDemoState extends State<ThirdDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ThirdDemo'),
    );
  }
}

class SecondDemo extends StatefulWidget {
  SecondDemo({Key key}) : super(key: key);

  @override
  _SecondDemoState createState() => _SecondDemoState();
}

class _SecondDemoState extends State<SecondDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('SecondDemo'),
    );
  }
}

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ListDemo'),
    );
  }
}

class FirstDemo extends StatefulWidget {
  @override
  _FirstDemoState createState() => _FirstDemoState();
}

class _FirstDemoState extends State<FirstDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('FirstDemo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TestBoostNavigatorObserver extends NavigatorObserver {
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPush');
  }

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPop');
  }

  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didRemove');
  }

  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print('flutterboost#didReplace');
  }
}

class FlutterRouteDemo extends StatefulWidget {
  final Map params;
  final String message;

  // 构造函数
  FlutterRouteDemo({this.params, this.message});

  @override
  _FlutterRouteDemoState createState() => _FlutterRouteDemoState();
}

class _FlutterRouteDemoState extends State<FlutterRouteDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
