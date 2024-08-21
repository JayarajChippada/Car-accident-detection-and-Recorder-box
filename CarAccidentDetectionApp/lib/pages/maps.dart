import 'package:flutter/material.dart';
import 'package:maps/components/drawer.dart';
import 'package:maps/widgets/map_widget.dart';

class MyMaps extends StatelessWidget {
  static String route = "mp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: MyMapWidget(),
    );
  }
}
