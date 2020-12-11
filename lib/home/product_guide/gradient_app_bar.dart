import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_guide_filter.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GradientAppBar extends StatefulWidget
{
  @override 
  _GradientAppBarState createState() => _GradientAppBarState();
}

class _GradientAppBarState extends State<GradientAppBar> {
  var levels;
  String _localFileContent='';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 26, bottom: 0, right: 16),
      decoration: BoxDecoration(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Cправочник продуктов',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          FloatingActionButton(
            focusElevation: 0.0,
            hoverElevation: 0.0,
            highlightElevation: 0.0,
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
                  builder: (context) => Filter(),
                ),
              );
            },
            child: Icon(
              Icons.format_list_bulleted_sharp,
            ),
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(58, 167, 177, 1),
          ),
        ],
      ),
    );

  
  }
  /* Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
  } */
  Future<String> get _getLocalPath async {
    final directory =await getApplicationDocumentsDirectory();
    return directory.path;
  }
  
  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/levels.txt');
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
