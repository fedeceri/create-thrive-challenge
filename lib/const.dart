import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const backGroundColor = Color.fromRGBO(0, 0, 0, 1.0);
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const primaryColor = Colors.white;
const secondaryColor = Colors.grey;
const darkGreyColor = Color.fromRGBO(97, 97, 97, 1);

class PageConst {
  static const String shoppingListScreen = "shoppingListScreen";
  static const String createItemAndCategoryScreen = "createItemAndCategoryScreen";
  static const String favoritesScreen = "favoritesScreen";
}

class FirebaseConst {
  static const String items = "items";
  static const String categories = "categories";
  static const String favorites = "favorites";
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: blueColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
