import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

var serviceList = [
  {'title': 'Retail Shop', 'duration': 45, 'price': 30},
  {'title': 'Retail Shop', 'duration': 45, 'price': 30},
  {'title': 'Retail Shop', 'duration': 45, 'price': 30},
  {'title': 'Retail Shop', 'duration': 45, 'price': 30},
];

class ShopDetailsScreen extends StatelessWidget {
  final stylist;

  ShopDetailsScreen(this.stylist);

  //GoogleMapController mapController;
  String searchAddr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3 + 20,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'lib/assets/images/shop.jpg',
                    scale: 5.7,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.blue.withOpacity(0.1),
                  )
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3 - 30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 140,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3 - 120,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      height: MediaQuery.of(context).size.height / 6 + 20,
                      decoration: BoxDecoration(
                        color: stylist['bgColor'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Positioned(
                              bottom: 0,
                              top: 0,
                              right: -30,
                              child: Image.asset(
                                'lib/assets/images/Shopkeeper.jpg',
                                scale: 1.5,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cameron Jones',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          stylist['shopName'],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        // Column(
                        //   children: <Widget>[
                        //     Container(
                        //       height: MediaQuery.of(context).size.height / 3,
                        //       width: MediaQuery.of(context).size.width,
                        //       child: GoogleMap(
                        //         initialCameraPosition: CameraPosition(
                        //             target: LatLng(29.9792, 31.1342),),
                        //       ),
                        //       //zoomGesturesEnabled: true,
                        //     )
                        //   ],
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
