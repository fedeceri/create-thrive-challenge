import 'package:challenge/const.dart';
import 'package:challenge/features/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Drawer? drawer;
  final String? screenName;
  final bool? haveAppBar;

  const CustomScaffold({
    Key? key,
    this.body,
    this.drawer,
    this.screenName = "",
    this.haveAppBar = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: body,
      appBar: haveAppBar! ? AppBar(
        backgroundColor: backGroundColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: IconThemeData(color: blueColor),
        title: Text(
          screenName ?? "",
          style: TextStyle(color: primaryColor),
        ),
      ) : null,
      drawer: CustomDrawer(),
    );
  }
}
