import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui';

void main() => runApp(const MyApp2());

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  late GoogleMapController mapController;
  late var loc = _initLocationService();
  LatLng _center = LatLng(45.1123, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _initLocationService().then((value) {
      var location = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }

  Future _initLocationService() async {
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    var loc = await location.getLocation();
    _center = LatLng(loc.latitude!.toDouble(), loc.longitude!.toDouble());
    print(
        "______________________________________________________________________________________$_center");

    print(
        "______________________________________________________________________________________${loc.latitude} ${loc.longitude}");
    print(
        "______________________________________________________________________________________${_center}");
    return loc;
  }
}
