import 'package:flutter/material.dart';

class AppSearch extends StatefulWidget {
  @override
  _AppSearchState createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
        top: 8,
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color.fromRGBO(56, 183, 143, 1),
            const Color.fromRGBO(58, 167, 177, 1),
          ],
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Поиск',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
