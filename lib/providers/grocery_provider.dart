import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/grocery_store_bloc.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoredBloc bloc;
  final Widget child;
  GroceryProvider({@required this.bloc, @required this.child})
      : super(child: child);

  static GroceryProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
