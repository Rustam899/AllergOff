import 'package:allerg_off_prototype/SQLlitedb/Allerg.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String fullTableTable = 'ft';
  String typeTable = 'type';
  String foodTable = 'food';
  String allergTable = 'allerg';
  String colTypeId = 'type_id';
  String colTypeName = 'type_name';
  String colFoodId = 'food_id';
  String colFoodName = 'food_name';
  String colAllergId = 'allerg_id';
  String colLacktoza = 'lack';
  String colFructoza = 'fruc';
  String colGistamin = 'gist';
  String colGluten = 'glut';
  String colSorbitol = 'sorb';
  String colSalicilCislota = 'salcis';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    String path = 'assets/db/aller.db';
    @override
    var allerDatabase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE ft (aller_id INTEGER, lack INTEGER, fruc INTEGER, gist INTEGER, glut INTEGER, sorb INTEGER, salcis INTEGER, food_id INTEGER, food_name TEXT, type_id INTEGER, type_name TEXT)');
    });

    return allerDatabase;
  }

  Future<List<Map<String, dynamic>>> findAllerMapList(
      UserLocal user, String findStr) async {
    Database db = await this.database;
    if (!user.personFilterOn || user.filterNumber == 0) {
      var res = await db.rawQuery(
          'SELECT * FROM $fullTableTable WHERE $colFoodName LIKE %$findStr% ORDER BY $colFoodName ASC');
      return res;
    } else if (user.personFilterOn) {
      if (user.filterNumber == 1) {
        var res = await db.rawQuery(
            'SELECT * FROM $fullTableTable WHERE $colFoodName LIKE %$findStr% AND ($colLacktoza < ${user.lactose} OR $colLacktoza = 0 OR $colLacktoza = 1) AND ($colFructoza < ${user.fructose} OR $colFructoza = 0 OR $colFructoza = 1) AND ($colGistamin < ${user.histamine} OR $colGistamin = 0 OR $colGistamin = 1) AND ($colGluten < ${user.gluten} OR $colGluten = 0 OR $colGluten = 1) AND ($colSorbitol < ${user.sorbitol} OR $colSorbitol = 0 OR $colSorbitol = 1) AND ($colSalicilCislota < ${user.salcylicAcid} OR $colSalicilCislota = 0 OR $colSalicilCislota = 1) ORDER BY $colFoodName ASC');
        return res;
      } else if (user.filterNumber == 2) {
        var res = await db.rawQuery(
            'SELECT * FROM $fullTableTable WHERE $colFoodName LIKE %$findStr% AND $colLacktoza <= ${user.lactose} AND $colFructoza <= ${user.fructose} AND $colGistamin <= ${user.histamine} AND $colGluten <= ${user.gluten} AND $colSorbitol <= ${user.sorbitol} AND $colSalicilCislota <= ${user.salcylicAcid} BY $colFoodName ASC');
        return res;
      } else if (user.filterNumber == 3) {
        var res = await db.rawQuery(
            'SELECT * FROM $fullTableTable WHERE $colFoodName LIKE %$findStr% AND ($colLacktoza > ${user.lactose} AND $colLacktoza > 1) AND ($colFructoza > ${user.fructose} AND $colFructoza > 1) AND ($colGistamin > ${user.histamine} AND $colGistamin > 1) AND ($colGluten > ${user.gluten} AND $colGluten > 1) AND ($colSorbitol > ${user.sorbitol} AND $colSorbitol > 1) AND ($colSalicilCislota > ${user.salcylicAcid} AND $colSalicilCislota > 1) ORDER BY $colFoodName ASC');
        return res;
      }
    }
  }

  Future<List<Map<String, dynamic>>> getAllerMapList() async {
    Database db = await this.database;
    var res = await db.query('ft');
    return res;
  }

  Future<List<Allerg>> getAllergList() async {
    var allergMapList = await getAllerMapList();
    int cnt = allergMapList.length;
    List<Allerg> allergList = List<Allerg>();

    for (int i = 0; i < cnt; i++) {
      allergList.add(Allerg.fromMapObject(allergMapList[i]));
    }

    return allergList;
  }

  Future<List<Allerg>> getFindAllergList(UserLocal user, String findStr) async {
    var allergMapList = await findAllerMapList(user, findStr);
    int cnt = allergMapList.length;
    List<Allerg> allergList = List<Allerg>();

    for (int i = 0; i < cnt; i++) {
      allergList.add(Allerg.fromMapObject(allergMapList[i]));
    }

    return allergList;
  }

  Future<List<Allerg>> getSelectAllergList(UserLocal user) async {
    var allergMapList = await selectTypeAllerMapList(user);
    int cnt = allergMapList.length;
    List<Allerg> allergList = List<Allerg>();

    for (int i = 0; i < cnt; i++) {
      allergList.add(Allerg.fromMapObject(allergMapList[i]));
    }

    return allergList;
  }

  Future<List<Map<String, dynamic>>> selectTypeAllerMapList(
      UserLocal user) async {
    Database db = await this.database;
    if (user.personFilterOn) {
      if (user.filterNumber == 1) {
        var res = await db.rawQuery(
            'SELECT * FROM $fullTableTable WHERE ($colLacktoza < ${user.lactose} OR $colLacktoza = 0 OR $colLacktoza = 1) AND ($colFructoza < ${user.fructose} OR $colFructoza = 0 OR $colFructoza = 1) AND ($colGistamin < ${user.histamine} OR $colGistamin = 0 OR $colGistamin = 1) AND ($colGluten < ${user.gluten} OR $colGluten = 0 OR $colGluten = 1) AND ($colSorbitol < ${user.sorbitol} OR $colSorbitol = 0 OR $colSorbitol = 1) AND ($colSalicilCislota < ${user.salcylicAcid} OR $colSalicilCislota = 0 OR $colSalicilCislota = 1) ORDER BY $colFoodName ASC');
        return res;
      } else if (user.filterNumber == 2) {
        var res = await db.rawQuery(
            'SELECT * FROM $fullTableTable WHERE $colLacktoza <= ${user.lactose} AND $colFructoza <= ${user.fructose} AND $colGistamin <= ${user.histamine} AND $colGluten <= ${user.gluten} AND $colSorbitol <= ${user.sorbitol} AND $colSalicilCislota <= ${user.salcylicAcid} BY $colFoodName ASC');
        return res;
      } else if (user.filterNumber == 3) {
        var res = await db.rawQuery(
            'SELECT * FROM $fullTableTable WHERE ($colLacktoza > ${user.lactose} AND $colLacktoza > 1) AND ($colFructoza > ${user.fructose} AND $colFructoza > 1) AND ($colGistamin > ${user.histamine} AND $colGistamin > 1) AND ($colGluten > ${user.gluten} AND $colGluten > 1) AND ($colSorbitol > ${user.sorbitol} AND $colSorbitol > 1) AND ($colSalicilCislota > ${user.salcylicAcid} AND $colSalicilCislota > 1) ORDER BY $colFoodName ASC');
        return res;
      }
    } else if (!user.personFilterOn || user.filterNumber == 0) {
      var res = await db
          .rawQuery('SELECT * FROM $fullTableTable ORDER BY $colFoodName ASC');
      return res;
    }
  }
}
