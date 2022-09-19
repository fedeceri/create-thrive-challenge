import 'package:challenge/features/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:challenge/features/presentation/cubit/shopping_item/shopping_item_cubit.dart';
import 'package:challenge/features/presentation/screens/create_item_and_category/create_item_and_category_screen.dart';
import 'package:challenge/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(Challenge());
}

class Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ShoppingItemCubit>()),
        BlocProvider(create: (_) => di.sl<CategoryCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CT Challenge - Shopping App',
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return CreateItemAndCategoryScreen();
          }
        }
      ),
    );
  }
}