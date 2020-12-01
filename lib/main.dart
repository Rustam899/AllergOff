import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/domain/User.dart';
import 'package:allerg_off_prototype/splash/load_screen.dart';
import 'package:allerg_off_prototype/splash/lending.dart';
import 'package:provider/provider.dart';
import 'package:allerg_off_prototype/services/auth.dart';

void main() => runApp(AllergOff());

class AllergOff extends StatefulWidget {
  @override
  _AllergOffState createState() => _AllergOffState();
}

class _AllergOffState extends State<AllergOff> {
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    '/Navigation/LendingPage': (BuildContext context) => LendingPage(),
  };
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:AuthService().currentUser,
      child:MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LoadScreen(nextRoute:'/Navigation/LendingPage'),
      routes: routes,
    ),
    );
  }
}
