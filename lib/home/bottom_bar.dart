import 'dart:ui';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../splash/load_screen.dart';
import 'package:allerg_off_prototype/home/product_guide.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex =
      0; //номер страницы( соответсвует индексу(номеру) кнопки в BottoNavigationBar)
  static List<Widget> _widgetOptions = <Widget>[
    //список экранов
    ProductGuide(),
    LoadScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Color.fromRGBO(56, 183, 143, 1),
        backgroundColorEnd: Color.fromRGBO(58, 167, 177, 1),
        items: const <BottomNavigationBarItem>[
          //навигация по приложению
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Colors.yellowAccent),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text('Home',style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person, color: Colors.yellowAccent),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text('Person',style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person, color: Colors.yellowAccent),
            icon: Icon(
              Icons.map,
              color: Colors.white,
            ),
            title: Text('Map',style: TextStyle(color: Colors.white)),
          ),
        ],
        currentIndex: _selectedIndex, //устанавливается индекс кнопки
        onTap:
            _onItemTapped, //при переключении на другую кнопку индекс этой("другой") кнопки передается в SetState(()=>{})
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
