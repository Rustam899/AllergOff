import 'package:allerg_off_prototype/components/product_card.dart';
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
            ProductCard(Text("Test",style: TextStyle(fontSize:16,color:Color.fromRGBO(55,71,113,1)),),Color.fromRGBO(220,88,80,1),3,3,3,3,3,3)
          ],
        ),
      ),
    );
  }
}
