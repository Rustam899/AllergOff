import 'package:flutter/material.dart';
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
        backgroundColor: Color.alphaBlend(
            Color.fromRGBO(56, 183, 143, 1), Color.fromRGBO(58, 167, 177, 1)),
        title: Text('Личный кабинет'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom:32),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical:12,horizontal:10),
              onPressed: () {
                AuthService().logOut();
              },
              child: Text("Выйти из учтеной запись",style: TextStyle(color:Colors.white,fontSize:18,),textAlign: TextAlign.center,),
              color: Color.alphaBlend(Color.fromRGBO(56, 183, 143, 1),
                  Color.fromRGBO(58, 167, 177, 1)),
            )
          ],
        ),
      ),
    );
  }
}
