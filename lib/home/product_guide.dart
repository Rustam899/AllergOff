import 'package:allerg_off_prototype/home/application_search.dart';
import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/home/bottom_bar.dart';
import 'package:allerg_off_prototype/home/gradient_app_bar.dart';

class ProductGuide extends StatefulWidget {
  @override
  _ProductGuideState createState() => _ProductGuideState();
}

class _ProductGuideState extends State<ProductGuide> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            GradientAppBar(),
            AppSearch(),
          ],
        ),
      ),
    );
  }
}
