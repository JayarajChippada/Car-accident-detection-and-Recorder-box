import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/values.dart';

class MyMapWidget extends StatefulWidget {
  @override
  State<MyMapWidget> createState() => _MyMapWidgetState();
}

class _MyMapWidgetState extends State<MyMapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition iiitcollege = CameraPosition(
    target: LatLng(13.5553, 80.0267),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    var latitude = Provider.of<Values>(context).mylatitude;
    var longtitude = Provider.of<Values>(context).mylongitude;
    LatLng sourceLocation = LatLng(latitude, longtitude);
    CameraPosition iiitcollege = CameraPosition(
    target: LatLng(latitude, longtitude),
    zoom: 14.4746,
  );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: GoogleMap(
        mapType: MapType.normal,
        markers: {
           Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
        },
        initialCameraPosition: iiitcollege,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
