import 'package:flutter/material.dart';
import 'package:movieapp/Service/OfflineResources.dart';
import 'package:movieapp/screens/NowPlaying/NowPlaying.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    hiveInitiators();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NowPlaying(),
    );
  }
}
