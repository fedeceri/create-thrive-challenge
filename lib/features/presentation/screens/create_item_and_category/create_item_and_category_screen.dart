import 'package:challenge/features/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';

class CreateItemAndCategoryScreen extends StatelessWidget {
  const CreateItemAndCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          backgroundColor: backGroundColor,
          title: const Text("Create Item and Category Screen", style: TextStyle(color: primaryColor),),
        )
    );
  }
}