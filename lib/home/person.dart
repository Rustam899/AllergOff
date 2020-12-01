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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LogOut'),
            FloatingActionButton(
              onPressed: () {
                AuthService().logOut();
              },
              child: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
