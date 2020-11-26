import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';

class LoadScreen extends StatefulWidget {
  final String nextRoute;
  LoadScreen({this.nextRoute});
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
        // Для этого используется статический метод навигатора
        // Это очень похоже на передачу лямбда функции в качестве аргумента std::function в C++
        () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color.fromRGBO(56, 183, 143, 1),
            const Color.fromRGBO(58, 167, 177, 1),
          ], // red to yello
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/icons/allergallerg.png'),
          ),
          Image(
            image: AssetImage('assets/icons/off.png'),
          ),
        ],
      ),
    );
  }
}
