
import 'package:challenge/const.dart';
import 'package:challenge/features/presentation/screens/create_item_and_category/create_item_and_category_screen.dart';
import 'package:challenge/features/presentation/screens/favorites/favorites_screen.dart';
import 'package:challenge/features/presentation/screens/shopping_list/shopping_list_screen.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {

  static Route<dynamic>? route(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case PageConst.shoppingListScreen: {
        return routeBuilder(ShoppingListScreen());
      }
      case PageConst.createItemAndCategoryScreen: {
        return routeBuilder(CreateItemAndCategoryScreen());
      }
      case PageConst.favoritesScreen: {
        return routeBuilder(FavoritesScreen());
      }
      default: {
        NoPageFound();
      }
    }
  }

  static routeBuilder(Widget child){
    return MaterialPageRoute(builder: (context) => child);
  }
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(child: Text("Page not found"),),
    );
  }
}