import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/grocery_product.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoredBloc with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }
}
