import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
            center: LatLng(59.939095, 30.315868),
            zoom: 10.0,
            minZoom: 8,
            maxZoom: 16),
        layers: [
          TileLayerOptions(
            urlTemplate: "http://tiles.maps.sputnik.ru/{z}/{x}/{y}.png",
          )
        ]);
  }
}
