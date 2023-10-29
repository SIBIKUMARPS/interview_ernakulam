// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool geofencingStatus = true;
  Position? curentPosition;
  getLocation() async {
    try {
      curentPosition = await Geolocator.getCurrentPosition();
     var distance = calculateDistance(10.010092, 76.336313,
          curentPosition!.latitude, curentPosition!.longitude);

      if (distance >= 200) {
        geofencingStatus = false;
      } else {
        geofencingStatus = true;
      }

      notifyListeners();
    } catch (e) {
      debugPrint("tge exeption iss $e");
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.0;
    var a = 0.0;
    p = 0.017453292519943295;
    a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    debugPrint("the distance iss ${(12742 * asin(sqrt(a))) * 1000}");
    return (12742 * asin(sqrt(a))) * 1000;
  }
}
