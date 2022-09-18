import 'package:challenge/features/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        screenName: "Favorites Screen",
    );
  }
}