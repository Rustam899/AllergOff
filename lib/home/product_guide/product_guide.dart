import 'package:allerg_off_prototype/components/allerList.dart';
import 'package:allerg_off_prototype/components/product_card.dart';
import 'package:allerg_off_prototype/home/Allergia/AllergiaList.dart';
import 'package:allerg_off_prototype/home/Allergia/get.dart';
import 'package:allerg_off_prototype/home/Food/FoodList.dart';
import 'package:allerg_off_prototype/home/product_guide/application_search.dart';
import 'package:flutter/material.dart';
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

  //final products = <ProductCard>[
  //ProductCard(Text("Яблоки"),Colors.grey[600],3,3,3,3,3,3),
  //ProductCard(Text("Сельдь"),Colors.grey[600],3,3,3,3,3,3),
  //ProductCard(Text("Бананы"),Colors.grey[600],3,3,3,3,3,3),
  //ProductCard(Text("Куриное мясо"),Colors.grey[600],3,3,3,3,3,3),
  //ProductCard(Text("Красное мясо"),Colors.grey[600],3,3,3,3,3,3),
  //ProductCard(Text("Огурцы"),Colors.grey[600],3,3,3,3,3,3),
  //ProductCard(Text("Креветки"),Colors.grey[600],3,3,3,3,3,3),
  //];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            GradientAppBar(),
            AppSearch(),
            Expanded(child: FoodList())
          ],
        ),
      ),
    );
  }
}
