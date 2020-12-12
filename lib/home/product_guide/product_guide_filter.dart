import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';
import 'package:provider/provider.dart';

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
                value: Provider.of<UserLocal>(context, listen: true)
                    .personFilterOn,
                onChanged: (value) {
                  Provider.of<UserLocal>(context, listen: false).setFilterOn =
                      value;
                  if (value == false) {
                    Provider.of<UserLocal>(context, listen: false)
                        .setFilterNumber = 0;
                  }
                },
                activeTrackColor: Color.fromRGBO(58, 177, 155, 1),
                activeColor: Colors.white,
              ),
            ],
          ),
          ListTile(
            //кнопка 1
            title: Text(
              'Показывать, то что можно',
              style: TextStyle(
                  color: Provider.of<UserLocal>(context, listen: true)
                          .personFilterOn
                      ? Color.fromRGBO(55, 71, 113, 1)
                      : Colors
                          .grey //если слайдер неактивен то текст и кнопки серого цвета(тернарный оператор)
                  ),
            ),
            leading: Radio(
              activeColor: Provider.of<UserLocal>(context, listen: true)
                      .personFilterOn
                  ? Color.fromRGBO(55, 71, 113, 1)
                  : Colors
                      .grey, //если слайдер неактивен то текст и кнопки серого цвета(тернарный оператор)
              value: 1,
              groupValue:
                  Provider.of<UserLocal>(context, listen: true).filterNumber,
              onChanged: Provider.of<UserLocal>(context, listen: true)
                      .personFilterOn
                  ? (int value) =>
                      Provider.of<UserLocal>(context, listen: false)
                          .setFilterNumber = value
                  : (int value) => Provider.of<UserLocal>(context,
                          listen: false)
                      .setFilterNumber = Provider.of<UserLocal>(context,
                          listen: true)
                      .filterNumber, // просто заглушка для тернарного оператора
            ),
          ),
          ListTile(
            //кнопка 3
            title: Text(
              'Показывать, то что нельзя',
              style: TextStyle(
                color: Provider.of<UserLocal>(context, listen: true)
                        .personFilterOn
                    ? Color.fromRGBO(55, 71, 113, 1)
                    : Colors
                        .grey, //если слайдер неактивен то текст и кнопки серого цвета
              ),
            ),
            leading: Radio(
              activeColor: Provider.of<UserLocal>(context, listen: true)
                      .personFilterOn
                  ? Color.fromRGBO(55, 71, 113, 1)
                  : Colors
                      .grey, //если слайдер неактивен то текст и кнопки серого цвета
              value: 3,
              groupValue:
                  Provider.of<UserLocal>(context, listen: true).filterNumber,
              onChanged: Provider.of<UserLocal>(context, listen: true)
                      .personFilterOn
                  ? (int value) =>
                      Provider.of<UserLocal>(context, listen: false)
                          .setFilterNumber = value
                  : (int value) => Provider.of<UserLocal>(context,
                          listen: false)
                      .setFilterNumber = Provider.of<UserLocal>(context,
                          listen: true)
                      .filterNumber, // просто заглушка для тернарного оператора
            ),
          ),
        ],
      ),
    );
  }
}
