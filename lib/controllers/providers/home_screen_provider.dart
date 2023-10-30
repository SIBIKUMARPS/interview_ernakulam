// ignore_for_file: deprecated_member_use

// import 'dart:math';
// import 'dart:async';

import 'dart:async';

import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool geofencingStatus = true;
  bool status = false;
  Position? curentPosition;

  statusChange(value) {
    status = !value;
    notifyListeners();
  }

  getLocation() async {
    EasyGeofencing.startGeofenceService(
        pointedLatitude: "10.010092",
        pointedLongitude: "76.336313",
        radiusMeter: "200",
        eventPeriodInSeconds: 5);

    StreamSubscription<GeofenceStatus> geofenceStatusStream =
        EasyGeofencing.getGeofenceStream()!.listen((GeofenceStatus status) {
      if (status.toString() == "GeofenceStatus.enter") {
        geofencingStatus = true;
        notifyListeners();
      } else {
        geofencingStatus = false;
        notifyListeners();
      }
    });

    print("the geofencestatus is ${geofenceStatusStream.toString()}");
  }

  stopFencing() async {
     geofencingStatus = true;
    EasyGeofencing.stopGeofenceService();
    notifyListeners();
  }

 }
