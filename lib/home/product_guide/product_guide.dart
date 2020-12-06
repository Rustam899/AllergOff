import 'package:allerg_off_prototype/components/allerList.dart';
import 'package:allerg_off_prototype/components/product_card.dart';
import 'package:allerg_off_prototype/home/Allergia/AllergiaList.dart';
import 'package:allerg_off_prototype/home/Allergia/get.dart';
import 'package:allerg_off_prototype/home/product_guide/application_search.dart';
import 'package:flutter/material.dart';
import 'package:allerg_off_prototype/home/Navigation/bottom_bar.dart';
import 'package:allerg_off_prototype/home/product_guide/gradient_app_bar.dart';
import 'package:allerg_off_prototype/domain/UserLocal.dart';

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
            /*Expanded(child: AllergiaList())*/
          ],
        ),
      ),
    );
  }
}
