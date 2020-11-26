import 'package:flutter/material.dart';
import 'splash/load_screen.dart';
import 'home/bottom_bar.dart';

void main() => runApp(AllergOff());

class AllergOff extends StatefulWidget {
  @override
  _AllergOffState createState() => _AllergOffState();
}

class _AllergOffState extends State<AllergOff> {
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    '/Home': (BuildContext context) => BottomBar(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LoadScreen(nextRoute: '/Home'),
      routes: routes,
    );
  }
}
