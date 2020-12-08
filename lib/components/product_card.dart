import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  Text _productName;
  Color _cardColorfruc;
  Color _cardColorlack;
  Color _cardColorgist;
  Color _cardColorsorb;
  Color _cardColorglut;
  Color _cardColorsolcis;
  int _fructose;
  int _lactose;
  int _histamine;
  int _sorbitol;
  int _gluten;
  int _salcylicAcid;
  ProductCard(
      this._productName,
      this._cardColorfruc,
      this._cardColorlack,
      this._cardColorgist,
      this._cardColorsorb,
      this._cardColorglut,
      this._cardColorsolcis,
      this._fructose,
      this._lactose,
      this._histamine,
      this._sorbitol,
      this._gluten,
      this._salcylicAcid);
  @override
  _CardState createState() => _CardState(
      _productName,
      _cardColorfruc,
      _cardColorlack,
      _cardColorgist,
      _cardColorsorb,
      _cardColorglut,
      _cardColorsolcis,
      _fructose,
      _lactose,
      _histamine,
      _sorbitol,
      _gluten,
      _salcylicAcid);
}

class _CardState extends State<ProductCard> {
  Text productName;
  Color cardColorfruc;
  Color cardColorlack;
  Color cardColorgist;
  Color cardColorsorb;
  Color cardColorglut;
  Color cardColorsolcis;
  int fructose;
  int lactose;
  int histamine;
  int sorbitol;
  int gluten;
  int salcylicAcid;
  _CardState(
      this.productName,
      this.cardColorfruc,
      this.cardColorlack,
      this.cardColorgist,
      this.cardColorsorb,
      this.cardColorglut,
      this.cardColorsolcis,
      this.fructose,
      this.lactose,
      this.histamine,
      this.sorbitol,
      this.gluten,
      this.salcylicAcid);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(246, 246, 246, 1)),
        width: double.infinity,
        height: 80,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              width: 16,
              height: 80,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, bottom: 8.0),
                      child: productName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      width: 280,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 32,
                            alignment: Alignment.center,
                            color: cardColorfruc,
                            child: Text(
                              "Ф",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(246, 246, 246, 1),
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 32,
                            alignment: Alignment.center,
                            color: cardColorlack,
                            child: Text(
                              "Л",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(246, 246, 246, 1),
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 32,
                            alignment: Alignment.center,
                            color: cardColorgist,
                            child: Text(
                              "Ги",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(246, 246, 246, 1)),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 32,
                            alignment: Alignment.center,
                            color: cardColorsorb,
                            child: Text(
                              "Со",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(246, 246, 246, 1)),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 32,
                            alignment: Alignment.center,
                            color: cardColorglut,
                            child: Text(
                              "Гл",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(246, 246, 246, 1)),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 32,
                            alignment: Alignment.center,
                            color: cardColorsolcis,
                            child: Text(
                              "Ск",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(246, 246, 246, 1)),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
