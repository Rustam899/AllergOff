import 'package:allerg_off_prototype/auth.dart';
import 'package:allerg_off_prototype/domain/User.dart';
import 'package:allerg_off_prototype/home/Navigation/bottom_bar.dart';
import 'package:allerg_off_prototype/home/person_area/levelAllerg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:path_provider/path_provider.dart';

class ChoiseLang extends StatefulWidget {
  @override
  _ChoiseLangState createState() => _ChoiseLangState();
}

class _ChoiseLangState extends State<ChoiseLang> {
  String _localFileContent = '';
  @override
  void initState() {
    super.initState();
    this.read();
  }

  bool isRu = true;
  Color colru = Color.fromRGBO(58, 177, 155, 1);
  Color colen = Color.fromRGBO(58, 177, 155, 1);
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    Widget _logo() {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 24,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment(0.8, 0.0),
                  colors: [
                    const Color.fromRGBO(56, 183, 157, 1),
                    const Color.fromRGBO(58, 167, 177, 1),
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/BackOnRegAuthTop.png'),
                  )),
                ),
                Container(
                  padding: EdgeInsets.only(top: 65),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image.asset('assets/icons/AllergAuth.png'),
                      Image.asset('assets/icons/OFFAuth.png'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _logo(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Выберите язык',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      'Choose language',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  RaisedButton(
                    elevation: 0.0,
                    splashColor: isRu
                        ? Color.fromRGBO(32, 144, 124, 1)
                        : Color.fromRGBO(58, 177, 155, 1),
                    highlightColor: Color.fromRGBO(32, 144, 124, 1),
                    color: isRu
                        ? Color.fromRGBO(32, 144, 124, 1)
                        : Color.fromRGBO(58, 177, 155, 1),
                    child: Text(
                      'Русский',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40),
                    ),
                    onPressed: () {
                      write('0');
                      return setState(() {
                        if (!isRu) {
                          isRu = !isRu;
                          Provider.of<UserLocal>(context, listen: false)
                              .setLanguage = 1;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      elevation: 0.0,
                      splashColor: !isRu
                          ? Color.fromRGBO(32, 144, 124, 1)
                          : Color.fromRGBO(58, 177, 155, 1),
                      highlightColor: colen,
                      color: !isRu
                          ? Color.fromRGBO(32, 144, 124, 1)
                          : Color.fromRGBO(58, 177, 155, 1),
                      child: Text(
                        'English',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40),
                      ),
                      onPressed: () {
                        write('1');
                        setState(() {
                          if (isRu) {
                            isRu = !isRu;
                            Provider.of<UserLocal>(context, listen: false)
                                .setLanguage = 2;
                          }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: RaisedButton(
                        elevation: 0.0,
                        splashColor: Color.fromRGBO(58, 177, 155, 1),
                        highlightColor: Color.fromRGBO(58, 177, 155, 1),
                        color: Color.fromRGBO(58, 177, 155, 1),
                        child: Icon(
                          Icons.arrow_right_alt,
                          size: 70,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          return isLoggedIn
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          BottomBar()))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AuthorizationPage()));
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void write(String str) async {
    await this._writeTextToLocalFile(str);
  }

  void read() async {
    await this._readTextFromLocalFile();
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/lang.txt');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = 'Error loading local file: $e';
    }

    setState(() {
      this._localFileContent = content;
    });
  }
}
