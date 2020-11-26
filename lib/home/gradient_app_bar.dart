import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 26, bottom: 0,right:16),
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
            
            onPressed: null,
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
}
