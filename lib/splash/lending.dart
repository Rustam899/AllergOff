import 'package:allerg_off_prototype/domain/User.dart';
import 'package:allerg_off_prototype/auth.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:allerg_off_prototype/home/Navigation/bottom_bar.dart';
import 'package:allerg_off_prototype/splash/choice_lang.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class LendingPage extends StatefulWidget {
  const LendingPage({Key key}) : super(key: key);
  @override
  _LendingPageState createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> {
  void read() async {
    await this._readTextFromLocalFile();
  }

  String _localFileContent = "none";

  @override
  void initState() {
    super.initState();
    this.read();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    print(_localFileContent);
    if (_localFileContent == "1" || _localFileContent == "0") {
      if (_localFileContent == "0") {
        Provider.of<UserLocal>(context, listen: false).setLanguage = 1;
      } else if (_localFileContent == "1") {
        Provider.of<UserLocal>(context, listen: false).setLanguage = 2;
      }
    }
    if (_localFileContent != "1" &&
        _localFileContent != "0" &&
        _localFileContent != "none") {
      return ChoiseLang();
    } else {
      if (isLoggedIn) {
        return BottomBar();
      } else {
        return AuthorizationPage();
      }
    }
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/lang.txt');
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
