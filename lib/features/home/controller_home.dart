import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:location/location.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  late TextEditingController searchController;

  final username = ''.obs;
  final image = ''.obs;
  final phone = ''.obs;

  Location location = Location();

  @override
  void onInit(){
    permissionHandler();
    getLocation();
    searchController = TextEditingController();
    setUser();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void setUser() async {
    var user = await Api2().getUser();
    username.value = user['username'] ?? "Pelanggan";
    image.value = user['image'] ?? "";
    phone.value = user['phone'] ?? "08xxxxxxxxxx";
  }

  permissionHandler()async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  getLocation() {
    location.onLocationChanged.listen((LocationData currentLocation) async {
      if (currentLocation != null) {
        await Api2().setLatitude(lat: currentLocation.latitude);
        await Api2().setLongitude(lng: currentLocation.longitude);
      }else{
        log("we con't see you");
      }
    });
  }
}
