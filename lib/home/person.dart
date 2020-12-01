import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/services/auth.dart';
import 'package:allerg_off_prototype/services/auth.dart';

class PersonWidget extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 167, 177, 1),
        title: Text('Пользователь'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                AuthService().logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
