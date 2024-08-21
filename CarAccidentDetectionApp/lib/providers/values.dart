import 'dart:convert';
import "package:alarmplayer/alarmplayer.dart";
import "package:flutter/foundation.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Values with ChangeNotifier {
  double temperature;
  bool gyro = false;
  double mylatitude, mylongitude;
  double speed;
  bool threshold;
  double vibration;
  String token;
  Alarmplayer alarmplayer;
  var stopped = false;
  Values(
      {this.temperature,
      this.gyro,
      this.mylatitude,
      this.mylongitude,
      this.speed,
      this.threshold,
      this.vibration,
      this.token,
      this.alarmplayer});
  LatLng get latlng {
    return LatLng(this.mylatitude, this.mylongitude);
  }

  Future<void> getValues() async {
    alarmplayer = Alarmplayer();
    final url = Uri.parse(
        "https://caraccidentdetection-e64fd-default-rtdb.firebaseio.com/.json");
    while (true) {
      final response = await http.get(url);
      final decoded = json.decode(response.body);
      print(decoded);
      temperature = (decoded["Distance"].runtimeType == int)
          ? (decoded["Temperature"] as int).toDouble()
          : decoded["Temperature"];
      gyro = decoded["Gyro"];
      mylatitude = (decoded["Latitude"].runtimeType == int)
          ? (decoded["Latitude"] as int).toDouble()
          : decoded["Latitude"];
      mylongitude = (decoded["Longitude"].runtimeType == int)
          ? (decoded["Longitude"] as int).toDouble()
          : decoded["Longitude"];
      speed = (decoded["Speed"].runtimeType == int)
          ? (decoded["Speed"] as int).toDouble()
          : decoded["Speed"];
      threshold = decoded["Threshold"];
      vibration = (decoded["Vibration"].runtimeType == int)
          ? (decoded["Vibration"] as int).toDouble()
          : decoded["Vibration"];
      notifyListeners();
      var isplaying = false;
      isplaying = await alarmplayer?.IsPlaying();
      if (threshold) {
        if (!isplaying && !stopped) {
          alarmplayer?.Alarm(url: "assets/alarm.mp3", volume: 0.7);
        } else if (isplaying) {
          alarmplayer?.StopAlarm();
        }
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void stopAlarm() async {
    var isplaying = await alarmplayer.IsPlaying();
    if (isplaying) {
      stopped = true;
      alarmplayer.StopAlarm();
    }
  }
}
