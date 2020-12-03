import 'package:flutter/cupertino.dart';

class UserLocal with ChangeNotifier{
  //значения непереносимостей от 0 до 4
  int _fructose = 0;
  int _lactose = 0;
  int _histamine = 0;
  int _sorbitol = 0;
  int _gluten = 0;
  int _salcylicAcid = 0;
  
  //настройки фильтра
  bool _personFilterOn =false; // фильтр вкл/вкл
  int _filterNumber = 0; // номер настройки фильтры(то что можно - 1,не рекомендованно - 2, нельзя - 3 , выключен - 0)
  //гетеры
  int get fructose => _fructose;
  int get lactose => _lactose;
  int get histamine => _histamine;
  int get sorbitol => _sorbitol;
  int get gluten => _gluten;
  int get salcylicAcid => _salcylicAcid;
  bool get personFilterOn => _personFilterOn;
  int get filterNumber => _filterNumber;

  //cеттеры
  set setFructose(int value) { 
    _fructose=value;
    notifyListeners();
  }
  set setLactose(int value) { 
    _lactose=value;
    notifyListeners();
  }
  set setHistamine(int value) {
    _histamine=value;
    notifyListeners();
  }
  set setSorbitol(int value) {
     _sorbitol=value;
     notifyListeners();
  }
  set setGluten(int value) { 
    _gluten=value;
    notifyListeners();
  }
  set setSalcylicAcid(int value) {
    _salcylicAcid=value;
    notifyListeners();
  }
  set setFilterOn(bool value) {
    _personFilterOn=value;
    notifyListeners();
  }
  set setFilterNumber(int value){
    _filterNumber=value;
    notifyListeners();
  }
} 