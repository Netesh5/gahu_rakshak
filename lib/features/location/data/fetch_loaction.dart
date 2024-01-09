import 'package:flutter/material.dart';
import 'package:gahurakshak/core/permission/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class FetchCurrentLocation with ChangeNotifier {
  Position? position;
  Future<void> fetchLocation() async {
    await PermissionHandler.locationPermission();
    if (await Permission.location.isGranted) {
      position = await Geolocator.getCurrentPosition();
      notifyListeners();
    }
    notifyListeners();
  }
}
