import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ShopDetails extends StatefulWidget {
  @override
  _shopDetailsState createState() => _shopDetailsState();
}

class _shopDetailsState extends State<ShopDetails> {
  bool isCheckedIn = false;
  var _latitudeForCalculation = 15.485223;
  var _longitudeForCalculation = 78.483628;

  Widget bottomAppBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: RaisedButton(
          onPressed: () {
            _pickTime();
          },
          child: const Text('Book Appointment',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          color: Colors.lime,
          textColor: Colors.white,
          elevation: 5,
        ),
      ),
    );
  }

  showConfirmationDialog(BuildContext context, TimeOfDay time) {
    int hour = time.hour;
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          Image.asset(
            'lib/assets/images/tick.png',
            scale: 17.6,
          ),
          Text(' Your appointment is confirmed.'),
        ],
      ),
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

  _pickTime() async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      showConfirmationDialog(context, time);
    }
  }

  Widget Items(String name, String price, String available, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 180.0,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            children: [
              Image(
                image: NetworkImage(imageUrl),
                width: 170,
                height: 160,
                alignment: Alignment.center,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                available,
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
              Text(
                '$price\$',
                style: TextStyle(fontSize: 22, color: Color(0xFFFF9900)),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
            child: Switch(
              activeColor: Colors.green,
              value: isCheckedIn,
              onChanged: (value) async {
                setState(() {
                  isCheckedIn = value;
                });
                if (value == false) {
                  return alertCheckOut(context);
                } else {
                  var distance = await getUserLocation();

                  if (distance != null) {
                    //print(getUserLocation.toString());
                    //return showAlertDialog(context);
                  } else {
                    return showAlertDialog(context);
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      hintText: "Search",
                      prefix: Icon(Icons.search),
                      fillColor: Colors.white70,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.solid),
                          borderRadius:
                              BorderRadius.all(Radius.circular(16))))),
            ),
          ),
          Container(
            width: double.infinity,
            height: 270,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Items(
                  "Green Gram 500g",
                  "2",
                  "Available: 52",
                  "https://5.imimg.com/data5/KB/YI/MY-39956368/green-gram-mung-dal-mung-beans-500x500.jpg",
                ),
                Items(
                  "Rice Bag 25kg",
                  "15",
                  "Available: 46",
                  "https://img1.exportersindia.com/product_images/bc-full/dir_181/5428832/rice-bags-1515756843-3576043.jpeg",
                ),
                Items(
                  "Honey 500ml",
                  "5",
                  "Available: 20",
                  "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sugar-substitutes-honey-700-350-4211d21.jpg?quality=90&resize=768,574",
                ),
                Items(
                  "Olive Oil 500ml",
                  "3",
                  "Available: 15",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSN5kvMqII09tKmgEINT-BqFaWl_rjfgY7HsQ&usqp=CAU",
                ),
                Items(
                  "Ghee 1kg",
                  "5",
                  "Available: 5",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGl_0i1ypT9S-p2Y7GLUfAKA308zDtNBQlsw&usqp=CAU",
                ),
                Items(
                  "Tooth Paste 500g",
                  "1",
                  "Available: 78",
                  "https://www.oesmiles.com/wp-content/uploads/2016/11/smile-with-braces-2.jpg",
                ),
              ],
            ),
          ),
          bottomAppBar(),
          // RaisedButton(
          //     child: Text('Check in'),
          //     onPressed:
          //         MyAlert()), //getUserLocation() == null ? _alertNotInRange() : null),
        ],
      ),
    );
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
    // final coordinates =
    //     new Coordinates(_locationData.latitude, _locationData.longitude);
    // var addresses =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = addresses.first;
    var _distanceInMeters = await Geolocator().distanceBetween(
      _latitudeForCalculation,
      _longitudeForCalculation,
      _locationData.latitude,
      _locationData.longitude,
    );
    if (_distanceInMeters > 100) {
      _distanceInMeters = null;
    }
    return _distanceInMeters;
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

  alertCheckOut(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Check-Out Alert"),
      content: Text("Thanks for Shopping"),
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
}
