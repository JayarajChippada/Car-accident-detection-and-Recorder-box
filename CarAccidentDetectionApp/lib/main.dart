import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/components/order_tracking_page.dart';
import 'package:maps/pages/account.dart';
import 'package:maps/pages/homepage.dart';
import 'package:maps/pages/homepage1.dart';
import 'package:maps/pages/maps.dart';
import 'package:maps/providers/values.dart';
import 'package:maps/signupscr.dart';
import 'package:maps/widgets/map_widget.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';

//tyre pressure app

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Values>(
          create: (context) => Values(),
          update: (context, value, previous) => Values(
              temperature: previous.temperature,
              gyro: previous.gyro ?? false,
              mylatitude: previous.mylatitude,
              mylongitude: previous.mylongitude,
              speed: previous.speed,
              threshold: previous.threshold ?? false,
              vibration: previous.vibration,
              token: value.token,
              alarmplayer: previous.alarmplayer),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, value, _) => MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 28, 88, 183),
          )),
          debugShowCheckedModeBanner: false,
          title: 'Maps',
          home: value.isAuth
              ? MyHomepage1()
              : FutureBuilder(
                  future: value.tryAutoLogin(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const Scaffold()
                          : SignUpScr()),
          routes: {
            MyHomepage1.route: (context) => MyHomepage1(),
            OrderTrackingPage.route: (context) => OrderTrackingPage(),
            MyMaps.route: (context) => MyMaps(),
          },
        ),
      ),
    );
  }
}
