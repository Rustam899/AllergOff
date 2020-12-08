import 'package:allerg_off_prototype/home/Allergia/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert' show utf8;

class AllergiaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllergiaListState();
  }
}

class AllergiaListState extends State<AllergiaList> {
  List<Allergia> allergList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (allergList == null) {
      allergList = List<Allergia>();
      updateListView();
    }
    return getAllergListView();
  }

  ListView getAllergListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            title: Text(
              this.allergList[position].food_name,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Color getColorType(String allergen) {
    switch (allergen) {
      case "0":
        return Color.fromRGBO(83, 220, 80, 1);
        break;
      case "1":
        return Color.fromRGBO(173, 204, 34, 1);
        break;
      case "2":
        return Color.fromRGBO(220, 139, 80, 1);
        break;
      case "3":
        return Color.fromRGBO(233, 103, 75, 1);
        break;
      case "4":
        return Color.fromRGBO(220, 88, 80, 1);
        break;
    }
  }

  void updateListView() {
    Future<List<Allergia>> allergListFuture = obtainJson();
    allergListFuture.then((allergList) {
      setState(() {
        this.allergList = allergList;
        print(allergList[0].food_name);
        if (allergList.isEmpty) print('Kek');
        this.count = allergList.length;
      });
    });
  }

  Future<List<Allergia>> obtainJson() async {
    if (canRequest) {
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      //ссылка другая будет
      final response = await http.get(
          'https://jsonplaceholder.typicode.com/posts',
          headers:
              headers); // get запрос выдает список из json, где каждый json описывает один объект
      print(response.body);

      dynamic jsonObject = convert.jsonDecode(utf8.decode(response.bodyBytes));

      jsonObject.forEach((elem) {
        topTravelers += [Allergia.fromJson(elem)];
      });
      canRequest = false;
    }
  }
}
