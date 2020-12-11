import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Marker _marker;
  Timer _timer;
  int _markerIndex = 0;
  Location location = Location();
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        location.getLocation().then((p) {
          _marker = Marker(
            width: 80,
            height: 80,
            point: LatLng(p.latitude, p.longitude),
            builder: (ctx) => Container(
              child: Icon(
                Icons.person,
              ),
            ),
          );
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (_marker == null) {
      return new Container();
    }
    return FlutterMap(
        options: MapOptions(
            center: _marker.point, zoom: 16.0, minZoom: 10, maxZoom: 22),
        layers: [
          new TileLayerOptions(
            urlTemplate: "http://tiles.maps.sputnik.ru/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(markers: <Marker>[_marker]),
        ]);
  }
}
