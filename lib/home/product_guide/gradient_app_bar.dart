import 'package:flutter/material.dart';
import 'product_guide_filter.dart';

class GradientAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 26, bottom: 0, right: 16),
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
            focusElevation: 0.0,
            hoverElevation: 0.0,
            highlightElevation: 0.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Filter(),
                ),
              );
            },
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
