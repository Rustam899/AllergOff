import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert' show utf8;

//класс, соответсвующий объекту из бд
class Allergia {
  final String food_name, type_name;
  final int allerg_id, lack, fruc, gist, glut, sorb, salcis, food_id, type_id;

  Allergia(
      {this.allerg_id,
      this.lack,
      this.fruc,
      this.gist,
      this.glut,
      this.sorb,
      this.salcis,
      this.food_id,
      this.food_name,
      this.type_id,
      this.type_name});

  factory Allergia.fromJson(Map<String, dynamic> json) {
    return Allergia(
        allerg_id: json["allerg_id"],
        lack: json["lack"],
        fruc: json["fruc"],
        gist: json["gist"],
        glut: json["glut"],
        sorb: json["sorb"],
        salcis: json["salcis"],
        food_id: json["food_id"],
        food_name: json["food_name"],
        type_id: json["type_id"],
        type_name: json["type_name"]);
  }
}

//список этих объектов
List<Allergia> topTravelers = [];

class TopTravelers extends StatefulWidget {
  const TopTravelers({Key key, int state}) : super(key: key);

  @override
  _TopTravelersState createState() => _TopTravelersState();
}

bool canRequest = true;

class _TopTravelersState extends State<TopTravelers> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: obtainJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return; // ну тут верстка
        });
  }

  Future<List<Allergia>> obtainJson() async {
    if (canRequest) {
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      //ссылка другая будет
      final response = await http.get('http://127.0.0.1:5000/',
          headers:
              headers); // get запрос выдает список из json, где каждый json описывает один объект

      dynamic jsonObject = convert.jsonDecode(utf8.decode(response.bodyBytes));

      jsonObject.forEach((elem) {
        topTravelers += [Allergia.fromJson(elem)];
      });
      canRequest = false;
    }
  }
}
