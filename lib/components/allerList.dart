import 'package:allerg_off_prototype/SQLlitedb/Allerg.dart';
import 'package:allerg_off_prototype/SQLlitedb/selectes.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

UserLocal user;

class AllerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllerListState();
  }
}

class AllerListState extends State<AllerList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Allerg> allergList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (allergList == null) {
      allergList = List<Allerg>();
      updateListView();
    }
    return getAllergListView();
  }

  ListView getAllergListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            title: Text(
              this.allergList[position].foodName,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Color getColorType(String allergen) {
    switch (allergen) {
      case "0":
        return Color.fromRGBO(83, 220, 80, 1);
        break;
      case "1":
        return Color.fromRGBO(173, 204, 34, 1);
        break;
      case "2":
        return Color.fromRGBO(220, 139, 80, 1);
        break;
      case "3":
        return Color.fromRGBO(233, 103, 75, 1);
        break;
      case "4":
        return Color.fromRGBO(220, 88, 80, 1);
        break;
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Allerg>> allergListFuture = databaseHelper.getAllergList();
      allergListFuture.then((allergList) {
        setState(() {
          this.allergList = allergList;
          this.count = allergList.length;
        });
      });
    });
  }
}
