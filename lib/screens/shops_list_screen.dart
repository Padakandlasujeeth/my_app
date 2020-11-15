import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/shop_details.dart';

const stylistData = [
  {
    'shopName': 'S-Mart',
    'capacity': '50',
    'imageUrl': 'lib/assets/images/smallStore.jpg',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'shopName': 'Madras Store',
    'capacity': '20',
    'imageUrl': 'lib/assets/images/shopIcon.png',
    'bgColor': Color(0xffEBF6FF),
  },
  {
    'shopName': 'Small Bazar',
    'capacity': '40',
    'imageUrl': 'lib/assets/images/shopIcon.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'shopName': 'VVR Retail',
    'capacity': '20',
    'imageUrl': 'lib/assets/images/shopIcon.png',
    'bgColor': Color(0xffEBF6FF),
  }
];

class ShopListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1.6, //page heigth
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Shop List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      StylistCard(stylistData[0]),
                      StylistCard(stylistData[1]),
                      StylistCard(stylistData[2]),
                      StylistCard(stylistData[3]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3 - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: stylist['bgColor']),
      child: Stack(children: <Widget>[
        // Positioned(
        //   top: 20,
        //   right: -90,
        //   child: Image.asset(
        //     stylist['imageUrl'],
        //     width: MediaQuery.of(context).size.width * 0.60,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(top: 40, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                stylist['shopName'],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Maximum Allowed Shoppers: ' + stylist['capacity'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.people,
                    size: 16,
                    color: Color(0xff4E295B),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '12' + ' (approx shoppers count as per checkins)',
                    style: TextStyle(color: Color(0xff4E295B)),
                  ),
                ],
              ),
              SizedBox(height: 20, width: 5),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShopDetails())); //shopLocation(stylist)
                },
                color: Colors.blue,
                child: Text(
                  'View Profile',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
