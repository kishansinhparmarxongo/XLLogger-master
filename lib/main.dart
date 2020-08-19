import 'dart:async';

import 'package:XLLogger/injections.dart' as di;
import 'package:XLLogger/package/xllogger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package/printer/beautiful_printer.dart';
import 'repo/local_hive/pref_box.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*For android status bar color.For iOS please check ios/runner appdelegate file*/
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  //Set Whole App orientation
  ///Make sure you do coding inside native folders : android - ios
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  print("main()");
  //This code will ready our repo object for entire app.
  await di.initDependencies();
  runZoned<Future<void>>(
    () async {
      runApp(
        MyApp(),
      );
    },
    // onError: Crashlytics.instance.recordError,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  PrefBox prefBox = GetIt.I.get<PrefBox>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    try {
      int result = int.parse(1.0.toString());
    } catch (e, stack) {
      XLLogger(logName: "Main", printer: BeautifulPrinter()).e(
          '[{"name":"Ram", "email":"Ram@gmail.com"},{"name":"Bob", "email":"bob32@gmail.com"}]',
          e,
          stack);
    }
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
              style: Theme.of(context).textTheme.headline4,
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
