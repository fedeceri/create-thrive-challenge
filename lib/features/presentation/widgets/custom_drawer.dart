import 'package:flutter/material.dart';

import '../../../const.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Federico Ceriani",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "cerianifede@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: Icon(Icons.shopping_cart, color: backGroundColor, size: 80,),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_bag_outlined,
            ),
            title: const Text('Shopping list'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, PageConst.shoppingListScreen, (route) => false);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add,
            ),
            title: const Text('Create item/category'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, PageConst.createItemAndCategoryScreen, (route) => false);

              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, PageConst.favoritesScreen, (route) => false);
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
