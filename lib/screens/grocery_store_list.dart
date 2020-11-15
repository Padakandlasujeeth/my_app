import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/providers/grocery_provider.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/images/shop.jpg',
                  fit: BoxFit.fill,
                  height: 100,
                )
              ],
            ),
          );
        });
  }
}
