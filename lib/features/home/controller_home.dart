import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:location/location.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();

  var homeResponse = HomeResponse().obs;

  var loading = true.obs;

  Location location = Location();

  @override
  void onInit(){
    permissionHandler();
    getLocation();
    searchController = TextEditingController();
    setUser();
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  void getData() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      var res = await api.homeUser(controllerUserInfo.user.value.id ?? 0);
      homeResponse.value = HomeResponse.fromJson(res['data']);
      // print(homeResponse.value.adsResponse?.ads?.length);
      homeResponse.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "Terjadi kesalahan");
    }

    // print(res);
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
