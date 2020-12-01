import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int _num;
  bool _isSwitched;
  @override
  void initState() {
    _num = 0;
    _isSwitched = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 167, 177, 1),
        title: Text(
          'Мои непереносимости',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Персонализированный фильтр'),
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                    if (value==false) // когда слайдер в неактивном положении(_isSwitched) кнопка выбора фильтра слетает(_num=0)
                    {
                      _num=0;
                    }
                  });
                },
                activeTrackColor: Color.fromRGBO(58, 177, 155, 1),
                activeColor: Colors.white,
              ),
            ],
          ),
          ListTile(  //кнопка 1
            title: Text(
              'Показывать, то что можно',
              style: TextStyle(
                  color: _isSwitched ? Color.fromRGBO(55, 71, 113, 1) : Colors.grey //если слайдер неактивен то текст и кнопки серого цвета(тернарный оператор)
              ),
            ),
            leading: Radio(
              activeColor: _isSwitched ? Color.fromRGBO(55, 71, 113, 1) : Colors.grey, //если слайдер неактивен то текст и кнопки серого цвета(тернарный оператор)
              value: 1,
              groupValue: _num,
              onChanged: _isSwitched ? (int value) {
                setState(() {
                  _num = value;
                });
              } : (int value) { // просто заглушка для тернарного оператора ибо без else(':') он не работает
                setState(() {
                  _num = _num;
                });
              },
            ),
          ),
          ListTile( //кнопка 2
            title: Text(
              'Показывать, то что не рекомендовано',
              style: TextStyle(
                  color: _isSwitched ? Color.fromRGBO(55, 71, 113, 1) : Colors.grey, //если слайдер неактивен то текст и кнопки серого цвета(тернарный оператор)
              ),
            ),
            leading: Radio(
              activeColor: _isSwitched ? Color.fromRGBO(55, 71, 113, 1) : Colors.grey,//если слайдер неактивен то текст и кнопки серого цвета(тернарный оператор): Colors.grey[200],
              value: 2,
              groupValue: _num,
              onChanged: _isSwitched ? (int value) { 
                setState(() {
                  _num = value;
                });
              } : (int value) { // просто заглушка для тернарного оператора ибо без else(':') он не работает
                setState(() {
                  _num = _num;
                });
              },
            ),
          ),
          ListTile( //кнопка 3
            title: Text(
              'Показывать, то что нельзя',
              style: TextStyle(
                  color: _isSwitched ? Color.fromRGBO(55, 71, 113, 1) : Colors.grey //если слайдер неактивен то текст и кнопки серого цвета
              ),
            ),
            leading: Radio(
              activeColor: _isSwitched ? Color.fromRGBO(55, 71, 113, 1) : Colors.grey,  //если слайдер неактивен то текст и кнопки серого цвета
              value: 3,
              groupValue: _num,
              onChanged: _isSwitched ? (int value) { //если слайдер активен то меняем значение выбора кнопки
                setState(() {
                  _num = value;
                });
              } : (int value) { // просто заглушка для тернарного оператора ибо без else(':') он не работает
                setState(() {
                  _num = _num;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
