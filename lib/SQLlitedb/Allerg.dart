class Allerg {
  int _allergId;
  int _lack;
  int _fruc;
  int _gist;
  int _glut;
  int _sorb;
  int _salcis;
  int _foodId;
  String _foodName;
  int _typeId;
  String _typeName;

  /* Allerg(this._typeName, this._foodName, this._lack, this._fruc, this._gist,
      this._glut, this._sorb, this._salcis); */
  Allerg(
      this._allergId,
      this._lack,
      this._fruc,
      this._gist,
      this._glut,
      this._sorb,
      this._salcis,
      this._foodId,
      this._foodName,
      this._typeId,
      this._typeName);

  int get typeId => _typeId;
  int get foodId => _foodId;
  int get allergId => _allergId;
  int get lack => _lack;
  int get fruc => _fruc;
  int get gist => _gist;
  int get glut => _glut;
  int get sorb => _sorb;
  int get salcis => _salcis;
  String get typeName => _typeName;
  String get foodName => _foodName;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['allergId'] = _allergId;
    map['lack'] = _lack;
    map['fruc'] = _fruc;
    map['gist'] = _gist;
    map['glut'] = _glut;
    map['sorb'] = _sorb;
    map['salcis'] = _salcis;
    map['foodId'] = _foodId;
    map['foodName'] = _foodName;
    map['typeId'] = _typeId;
    map['typeName'] = _typeName;

    return map;
  }

  Allerg.fromMapObject(Map<String, dynamic> map) {
    this._allergId = map['allergId'];
    this._lack = map['lack'];
    this._fruc = map['fruc'];
    this._gist = map['gist'];
    this._glut = map['glut'];
    this._sorb = map['sorb'];
    this._salcis = map['salcis'];
    this._foodId = map['foodId'];
    this._foodName = map['foodName'];
    this._typeId = map['typeId'];
    this._typeName = map['typeName'];
  }
}
