import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// ignore: camel_case_types
class shopLocation extends StatelessWidget {
  final stylist;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  shopLocation(this.stylist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(15.485223, 78.483628), //pull from firebase
                zoom: 16.0,
              ),
              zoomGesturesEnabled: true,
            ),
          ),
          Container(
            child: MyAlert(),
          )
          // RaisedButton(
          //     child: Text('Check in'),
          //     onPressed:
          //         MyAlert()), //getUserLocation() == null ? _alertNotInRange() : null),
        ],
      ),
    );
  }
}

class MyAlert extends StatelessWidget {
  bool checkin = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        child: checkin ? Text("Check-Out") : Text("Check-In"),
        onPressed: () {
          checkin = !checkin;
          if (getUserLocation != null) {
            showAlertDialog(context);
          } else {
            showAlertDialog(context);
          }
        },
      ),
    );
  }
}

getUserLocation() async {
  Location location = new Location();
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
  final coordinates =
      new Coordinates(_locationData.latitude, _locationData.longitude);
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  return _locationData;
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(
        "Out of Checkin range!!!! \n\nPlease move towards the location range to checkin"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
