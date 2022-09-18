import 'package:challenge/features/presentation/screens/main_screen/main_screen.dart';
import 'package:challenge/features/presentation/screens/shopping_list/shopping_list_screen.dart';
import 'package:challenge/features/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Challenge());
}

class Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CT Challenge - Shopping App',
      routes: {
        "/": (context) {
          return MainScreen();
        }
      }
    );
  }
}