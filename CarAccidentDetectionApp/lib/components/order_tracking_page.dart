import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maps/components/constants.dart';
import 'package:provider/provider.dart';

import '../providers/values.dart';
import 'drawer.dart';

// class OrderTrackingPage extends StatefulWidget {
//   const OrderTrackingPage({super.key});

//   @override
//   State<OrderTrackingPage> createState() => _OrderTrackingPageState();
// }

// class _OrderTrackingPageState extends State<OrderTrackingPage> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng sourceLocation = LatLng(13.5553, 80.0267);
//   static const LatLng destination = LatLng(13.7009, 80.0209);

//   List<LatLng> polylineCoordinates = [];
//   LocationData? currentLocation;

// BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
// BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
// BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

//   void getCurrentLocation() async {
//     Location location = Location();

//     location.getLocation().then((location) {
//       currentLocation = location;
//     });

//     GoogleMapController googleMapController = await _controller.future;

//     location.onLocationChanged.listen((newLoc) {
//       currentLocation = newLoc;

//       googleMapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//               zoom: 13.5,
//               target: LatLng(
//                 newLoc.latitude!,
//                 newLoc.longitude!,
//               )),
//         ),
//       );

//       setState(() {});
//     });
//   }

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       google_api_key,
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach(
//         (PointLatLng point) =>
//             polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
//       );
//       setState(() {});
//     }
//   }

// void setCustomMarkerIcon() {
//   BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
//           "assets/icons/pin_currentLocation.jpg")
//       .then((icon) {
//     sourceIcon = icon;
//   });
//   BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
//           "assets/icons/pin_destinatioinLocatioin-Copy.jpg")
//       .then((icon) {
//     destinationIcon = icon;
//   });
//   BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
//           "assets/icons/caravatar.jpg")
//       .then((icon) {
//     currentLocationIcon = icon;
//   });
// }

//   @override
//   void initState() {
//     getCurrentLocation();
//     setCustomMarkerIcon();
//     getPolyPoints();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Track Order",
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//       ),
//       body: currentLocation == null
//           ? const Center(
//               child: Text("Loading"),
//             )
//           : GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(
//                       currentLocation!.latitude!, currentLocation!.longitude!),
//                   zoom: 13.5),
//               polylines: {
//                 Polyline(
//                   polylineId: PolylineId("route"),
//                   points: polylineCoordinates,
//                   color: primaryColor,
//                   width: 6,
//                 )
//               },
//               markers: {
//                 Marker(
//                   markerId: const MarkerId("currentLocation"),
//                   icon: currentLocationIcon,
//                   position: LatLng(
//                       currentLocation!.latitude!, currentLocation!.longitude!),
//                 ),
//                 Marker(
//                   markerId: MarkerId("source"),
//                   icon: sourceIcon,
//                   position: sourceLocation,
//                 ),
//                 Marker(
//                   markerId: MarkerId("destination"),
//                   icon: destinationIcon,
//                   position: destination,
//                 ),
//               },
//               onMapCreated: (mapController) {
//                 _controller.complete(mapController);
//               },
//             ),
//     );
//   }
// }

class OrderTrackingPage extends StatefulWidget {
  static String route = "otp";
  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  //static const LatLng sourceLocation = LatLng(13.5553, 80.0267);
  LatLng destination = LatLng(13.7009, 80.0209);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, // Your Google Map Key
      PointLatLng(currentLocation?.latitude, currentLocation?.longitude),
      PointLatLng(destination?.latitude, destination?.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  LocationData currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icons/pin_currentLocation.jpg")
        .then((icon) {
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
            "assets/icons/pin_destinatioinLocatioin-Copy.jpg")
        .then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icons/caravatar.jpg")
        .then((icon) {
      currentLocationIcon = icon;
    });
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude,
                newLoc.longitude,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    destination = Provider.of<Values>(context).latlng;
    getPolyPoints();
    setCustomMarkerIcon();
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Tracking'),
        titleSpacing: 70,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(currentLocation.latitude, currentLocation.longitude),
                zoom: 13.5,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: LatLng(
                      currentLocation.latitude, currentLocation.longitude),
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                ),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
    );
  }
}
