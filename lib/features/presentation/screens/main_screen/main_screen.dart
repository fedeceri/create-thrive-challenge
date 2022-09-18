import 'package:challenge/features/presentation/screens/favorites/favorites_screen.dart';
import 'package:challenge/features/presentation/screens/shopping_list/shopping_list_screen.dart';
import 'package:challenge/features/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../create_item_and_category/create_item_and_category_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      haveAppBar: false,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          onPageChanged(index);
        },
        children: const [
          ShoppingListScreen(),
          CreateItemAndCategoryScreen(),
          FavoritesScreen(),
        ],
      ),
    );
  }
}
