import 'package:challenge/const.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final AppBar appBar;

  const CustomScaffold({Key? key, this.body, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: body,
      appBar: appBar,
    );
  }
}
