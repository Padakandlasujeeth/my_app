import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/geolocator_service.dart';
import 'package:flutter_complete_guide/screens/grocery_store_list.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/shops_list_screen.dart';
import 'screens/shop_location.dart';
//import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final locationService = GeoLocatorService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'Safe Shopping',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.black,
              fontFamily: 'Lato',
            ),
            home: auth.isAuth ? ShopListScreen() : AuthScreen(),
            routes: {},
          ),
        ));
  }
}
