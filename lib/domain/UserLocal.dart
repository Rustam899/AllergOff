class UserLocal {
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

  UserLocal(this._fructose,this._lactose,
           this._histamine,this._sorbitol,
           this._gluten,this._salcylicAcid,
           this._personFilterOn,this._filterNumber);

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
  set setFructose(int value) => _fructose=value;
  set setLactose(int value) => _lactose=value;
  set setHistamine(int value) => _histamine=value;
  set setSorbitol(int value) => _sorbitol=value;
  set setGluten(int value) => _gluten=value;
  set setSalcylicAcid(int value) => _salcylicAcid=value;
  set setFilterOn(bool value) => _personFilterOn=value;

} 