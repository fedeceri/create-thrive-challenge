import 'package:challenge/features/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: const Text("Shopping List Screen", style: TextStyle(color: primaryColor),),
      )
    );
  }
}