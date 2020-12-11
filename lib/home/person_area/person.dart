import 'dart:io';
import 'dart:developer';
import 'package:allerg_off_prototype/home/person_area/levelAllerg.dart';
import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class PersonWidget extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<PersonWidget> {
  var levels;
  String _localFileContent;
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    this._readTextFromLocalFile();
  }

  void write(String str) async{
    await this._writeTextToLocalFile(str);
  }
  void read () async{
    await this._readTextFromLocalFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 32),
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 158,
                    color: Color.fromRGBO(58, 177, 155, 1),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 85),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: const Color.fromRGBO(58, 177, 155, 1),
                        shape: const CircleBorder(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 110,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Выйти',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(220, 88, 80, 1)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Color.fromRGBO(220, 88, 80, 1),
                          ),
                          onPressed: () {
                            AuthService().logOut();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 49.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.only(left: 20),
                            onPressed: null,
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Мой календарь',
                                  style: TextStyle(fontSize: 12,color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            padding: EdgeInsets.only(left: 24),
                            onPressed: null,
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.info_outline,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Информация',
                                  style: TextStyle(fontSize: 12,color:Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 49.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.only(left: 0),
                            onPressed: () async {
                                var file= await _getLocalFile;
                                if (file.existsSync())
                                {
                                await this._readTextFromLocalFile();
                                levels=_localFileContent.split(' ');
                                Provider.of<UserLocal>(context,listen: false).setFructose=double.tryParse(levels[0].toString());
                                Provider.of<UserLocal>(context,listen: false).setLactose=double.tryParse(levels[1].toString());
                                Provider.of<UserLocal>(context,listen: false).setHistamine=double.tryParse(levels[2].toString());
                                Provider.of<UserLocal>(context,listen: false).setSorbitol=double.tryParse(levels[3].toString());
                                Provider.of<UserLocal>(context,listen: false).setGluten=double.tryParse(levels[4].toString());
                                Provider.of<UserLocal>(context,listen: false).setSalcylicAcid=double.tryParse(levels[5].toString());
                                } else
                                {
                                Provider.of<UserLocal>(context,listen: false).setFructose=0;
                                Provider.of<UserLocal>(context,listen: false).setLactose=0;
                                Provider.of<UserLocal>(context,listen: false).setHistamine=0;
                                Provider.of<UserLocal>(context,listen: false).setSorbitol=0;
                                Provider.of<UserLocal>(context,listen: false).setGluten=0;
                                Provider.of<UserLocal>(context,listen: false).setSalcylicAcid=0;
                                }
                            
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllergLevels(),
                                ),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.book,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Мои непереносимости',
                                  style: TextStyle(fontSize: 12,color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            padding: EdgeInsets.only(left: 0),
                            onPressed: null,
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.settings,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Настройки',
                                  style: TextStyle(fontSize: 12,color:Colors.grey,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              /* RaisedButton(
                padding: EdgeInsets.symmetric(vertical:12,horizontal:10),
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllergLevels(),
                  ),
                );
               },
                child: Text("Мои непереносимости",style: TextStyle(color:Colors.white,fontSize:18,),textAlign: TextAlign.center,),
                color: Color.alphaBlend(Color.fromRGBO(56, 183, 143, 1),
                    Color.fromRGBO(58, 167, 177, 1)),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical:12,horizontal:10),
                onPressed: () {
                  AuthService().logOut();
                },
                child: Text("Выйти из учтеной запись",style: TextStyle(color:Colors.white,fontSize:18,),textAlign: TextAlign.center,),
                color: Color.alphaBlend(Color.fromRGBO(56, 183, 143, 1),
                    Color.fromRGBO(58, 167, 177, 1)),
              ) */
            ],
          ),
        ),
      ),
    );
  }
  Future<String> get _getLocalPath async {
    final directory =await getApplicationDocumentsDirectory();
    return directory.path;
  }
  
  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/uevels.txt');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async{
    String content;
    try{
      final file = await _getLocalFile;
      content= await file.readAsString();
    }catch(e)
    {
      content= 'Error loading loacl file: $e';
    }

    setState(() {
      this._localFileContent=content;
    });
  }
}
