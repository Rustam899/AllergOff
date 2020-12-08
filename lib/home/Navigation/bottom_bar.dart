import 'dart:ui';
import 'package:allerg_off_prototype/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/home/product_guide/product_guide.dart';
import 'package:allerg_off_prototype/home/person_area/person.dart';
import 'package:allerg_off_prototype/home/map/Map.dart';

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
    PersonWidget(),
    Map(),
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
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: Color.alphaBlend(
            Color.fromRGBO(56, 183, 143, 1), Color.fromRGBO(58, 167, 177, 1)),
        /* backgroundColor: Color.alphaBlend(
            Color.fromRGBO(56, 183, 143, 1), Color.fromRGBO(58, 167, 177, 1)), */
        backgroundColor: Colors.white,
        items: <Widget>[
          _selectedIndex == 0
              ? Icon(
                  Icons.home,
                  color: Colors.yellow,
                  size: 35,
                )
              : Icon(Icons.home, color: Colors.white),
          _selectedIndex == 1
              ? Icon(Icons.person, color: Colors.yellow, size: 35)
              : Icon(Icons.person, color: Colors.white),
          _selectedIndex == 2
              ? Icon(Icons.map, color: Colors.yellow, size: 35)
              : Icon(Icons.map, color: Colors.white),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: _onItemTapped,
        /* GradientBottomNavigationBar(
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
            activeIcon: Icon(Icons.map, color: Colors.yellowAccent),
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
      ), */
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
