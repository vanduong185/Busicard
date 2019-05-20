import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:sns_connect/src/index.dart';

Future<Null> main() async{
  SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1980BA) // set status bar color
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(App());
  });
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busicard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Index(),
      debugShowCheckedModeBanner: false,
    );
  }
}
