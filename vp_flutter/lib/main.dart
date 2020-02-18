import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
