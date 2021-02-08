import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserLocal with ChangeNotifier {
  //значения непереносимостей от 0 до 4
  double _fructose;
  double _lactose;
  double _histamine;
  double _sorbitol;
  double _gluten;
  double _salcylicAcid;

  //язык в приложении
  int _language; //1 - ru, 2 - en

  //настройки фильтра
  bool _personFilterOn = false; // фильтр вкл/вкл
  int _filterNumber =
      0; // номер настройки фильтры(то что можно - 1,не рекомендованно - 2, нельзя - 3 , выключен - 0)
  //гетеры
  double get fructose => _fructose;
  double get lactose => _lactose;
  double get histamine => _histamine;
  double get sorbitol => _sorbitol;
  double get gluten => _gluten;
  double get salcylicAcid => _salcylicAcid;
  bool get personFilterOn => _personFilterOn;
  int get filterNumber => _filterNumber;
  int get language => _language;

  //cеттеры
  set setFructose(double value) {
    _fructose = value;
    notifyListeners();
  }

  set setLactose(double value) {
    _lactose = value;
    notifyListeners();
  }

  set setHistamine(double value) {
    _histamine = value;
    notifyListeners();
  }

  set setSorbitol(double value) {
    _sorbitol = value;
    notifyListeners();
  }

  set setGluten(double value) {
    _gluten = value;
    notifyListeners();
  }

  set setSalcylicAcid(double value) {
    _salcylicAcid = value;
    notifyListeners();
  }

  set setFilterOn(bool value) {
    _personFilterOn = value;
    notifyListeners();
  }

  set setFilterNumber(int value) {
    _filterNumber = value;
    notifyListeners();
  }

  set setLanguage(int val) {
    _language = val;
    notifyListeners();
  }
}
