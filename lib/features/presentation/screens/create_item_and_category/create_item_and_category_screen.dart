import 'package:challenge/features/presentation/screens/create_item_and_category/create_category.dart';
import 'package:challenge/features/presentation/screens/create_item_and_category/create_item.dart';
import 'package:challenge/features/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';

class CreateItemAndCategoryScreen extends StatefulWidget {
  const CreateItemAndCategoryScreen({Key? key}) : super(key: key);

  @override
  State<CreateItemAndCategoryScreen> createState() => _CreateItemAndCategoryScreenState();
}

class _CreateItemAndCategoryScreenState extends State<CreateItemAndCategoryScreen> {
  bool categoryCreation = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      screenName: "Create Item and Category",
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoSwitch(
                    value: categoryCreation,
                    onChanged: (value) {
                      setState(() {
                        _switchPages(value);
                      });
                    },
                    activeColor: blueColor.withOpacity(0.3),
                    thumbColor: blueColor,
                    trackColor: blueColor.withOpacity(0.3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Item",
                        style: TextStyle(
                          color: !categoryCreation ? blueColor : Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                          color: categoryCreation ? blueColor : Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider()
                ],
              ),
            ),
            categoryCreation ? CreateCategorySection() :
            CreateItemSection()
          ],
        ),
      ),
    );
  }

  _switchPages(bool value) {
    categoryCreation = value;
  }
}
