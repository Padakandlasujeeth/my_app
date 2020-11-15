import 'dart:io';

import 'package:flutter/foundation.dart';

class ShopLocation {
  final double latitude;
  final double longitude;
  final String address;

  ShopLocation(
      {@required this.latitude,
      @required this.longitude,
      @required this.address});
}

class Shop {
  final String id;
  final String title;
  final ShopLocation location;
  final File image;
  Shop({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
